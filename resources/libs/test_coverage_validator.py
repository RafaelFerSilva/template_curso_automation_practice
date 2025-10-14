import sys
import os
import io
import pytz
from datetime import datetime
from robot.api import ExecutionResult
import argparse

# Force UTF-8 encoding
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')
sys.stderr = io.TextIOWrapper(sys.stderr.buffer, encoding='utf-8')

# Set the timezone to Brazil/Sao Paulo
brazil_tz = pytz.timezone('America/Sao_Paulo')

def generate_markdown_report(result, min_pass_rate):
    """
    Generates a test pass_rate report in Markdown format.

    This function analyzes the test execution results and creates a detailed
    Markdown report showing pass_rate statistics and suite breakdown.

    Args:
        result (ExecutionResult): Robot Framework test execution result object
        min_pass_rate (float): Minimum required pass_rate percentage

    Returns:
        str: Report in Markdown format with pass_rate statistics and suite details

    Example:
        | ${report}= | Generate Markdown Report | ${result} | 80.0 |
    """
    # Calculate statistics
    total_tests = result.statistics.total.total
    passed_tests = result.statistics.total.passed
    failed_tests = result.statistics.total.failed
    skipped_tests = result.statistics.total.skipped

    # Calculate percentage of passed tests
    pass_percentage = (passed_tests / total_tests) * 100

    # Determine pass_rate status
    pass_rate_status = "Passed ✅" if pass_percentage >= min_pass_rate else "Failed ❌"

    # Create Markdown report
    markdown_report = f"""## Test pass_rate Report

### General Summary
| Metric | Value |
|--------|-------|
| Pass Rate Status | {pass_rate_status} |
| Minimum Required Pass Rate | {min_pass_rate}% |
| Current Pass Rate | {pass_percentage:.2f}% |

### Test Details
| Test Type | Quantity |
|-----------|----------|
| Total Tests | {total_tests} |
| Passed Tests | {passed_tests} |
| Failed Tests | {failed_tests} |
| Skipped Tests | {skipped_tests} |

### Suite Breakdown
| Suite | Total Tests | Passed Tests | Pass Rate |
|-------|-------------|--------------|----------|
"""

    # Add details for each test suite
    for suite in result.statistics.suite:
        suite_pass_percentage = (suite.passed / suite.total) * 100 if suite.total > 0 else 0
        markdown_report += f"| {suite.name} | {suite.total} | {suite.passed} | {suite_pass_percentage:.2f}% |\n"

    # Add footer with Brazil timezone
    markdown_report += f"\n*Generated on: {datetime.now(brazil_tz).strftime('%Y-%m-%d %H:%M:%S')}*"

    return markdown_report

def save_markdown_report(report, output_dir):
    """
    Saves the Markdown report to a file.

    This function creates the output directory if it doesn't exist and
    saves the Markdown report with a timestamped filename.

    Args:
        report (str): Markdown report content
        output_dir (str): Directory to save the report

    Returns:
        str: Full path of the generated file

    Example:
        | ${filepath}= | Save Markdown Report | ${report} | test_reports |
    """
    # Create directory if it doesn't exist
    os.makedirs(output_dir, exist_ok=True)

    # Generate filename using Brazil timezone
    filename = f"test_pass_rate_report_{datetime.now(brazil_tz).strftime('%Y%m%d_%H%M%S')}.md"
    filepath = os.path.join(output_dir, filename)

    # Save file with UTF-8 encoding
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(report)

    print(f"Markdown report generated at: {filepath}")

    return filepath

def validate_test_pass_rate(
    output_file,
    min_pass_rate=80,
    output_dir='test_reports'
):
    """
    Validates test pass_rate and generates a Markdown report.

    This function analyzes the Robot Framework output.xml file, calculates
    test pass_rate, generates a report, and validates if the pass_rate meets
    the minimum requirement.

    Args:
        output_file (str): Path to Robot Framework output.xml file
        min_pass_rate (float, optional): Minimum required pass_rate percentage. Defaults to 80.
        output_dir (str, optional): Directory to save reports. Defaults to 'test_reports'.
        verbose (bool, optional): Enables detailed logging. Defaults to True.

    Raises:
        AssertionError: If test pass_rate is below the specified minimum.

    Example:
        | Validate Test pass_rate | output.xml | min_pass_rate=85 | output_dir=reports |
    """
    try:
        # Load test execution result
        result = ExecutionResult(output_file)

        # Calculate percentage of passed tests
        total_tests = result.statistics.total.total
        passed_tests = result.statistics.total.passed
        pass_percentage = (passed_tests / total_tests) * 100

        # Generate Markdown report
        markdown_report = generate_markdown_report(result, min_pass_rate)

        # Save Markdown report
        save_markdown_report(markdown_report, output_dir)

        # Validate minimum pass_rate
        if pass_percentage < min_pass_rate:
            print("Test pass_rate Failed")
            raise AssertionError(
                f"Test pass_rate of {pass_percentage:.2f}% "
                f"is below the required minimum of {min_pass_rate}%"
            )

        print(f"Test pass_rate passed: {pass_percentage:.2f}%")
        sys.exit(0)

    except Exception as e:
        print(f"Error in pass_rate validation: {e}")
        sys.exit(1)

def main():
    """
    Main function for command-line execution.

    This function parses command-line arguments and calls the validate_test_pass_rate
    function with the provided parameters.

    Command-line arguments:
        output_file: Path to output.xml file
        --min-pass_rate: Minimum pass_rate percentage (default: 80)
        --output-dir: Directory to save reports (default: 'test_reports')
        --quiet: Disable detailed logging

    Example usage:
        python test_pass_rate_validator.py output.xml --min-pass_rate 85 --output-dir reports
    """

    parser = argparse.ArgumentParser(description='Test pass_rate Validator')
    parser.add_argument('output_file', help='Path to output.xml file')
    parser.add_argument('--min-pass_rate', type=float, default=80,
                        help='Minimum pass_rate percentage (default: 80)')
    parser.add_argument('--output-dir', default='test_reports',
                        help='Directory to save reports')
    parser.add_argument('--quiet', action='store_true',
                        help='Disable detailed logging')

    args = parser.parse_args()

    validate_test_pass_rate(
        args.output_file,
        min_pass_rate=args.min_pass_rate,
        output_dir=args.output_dir
    )

if __name__ == "__main__":
    main()
