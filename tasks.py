from invoke import task
import os

# Variáveis padrão
DEFAULT_REPORTS_DIR = "./reports"
DEFAULT_TESTS_DIR = "./tests"
DEFAULT_PROCESSES = 4

@task
def test_all(c, reports_dir=DEFAULT_REPORTS_DIR, tests_dir=DEFAULT_TESTS_DIR):
    """Executa todos os testes"""
    cmd = f"robot -d {reports_dir} {tests_dir}"
    print(f"Executando: {cmd}")
    c.run(cmd)

@task
def test_smoke(c, reports_dir=DEFAULT_REPORTS_DIR, tests_dir=DEFAULT_TESTS_DIR):
    """Executa apenas os testes smoke"""
    cmd = f"robot -d {reports_dir} -i smoke {tests_dir}"
    print(f"Executando: {cmd}")
    c.run(cmd)

@task
def test_tag(c, tag, reports_dir=DEFAULT_REPORTS_DIR, tests_dir=DEFAULT_TESTS_DIR):
    """Executa testes com uma tag específica"""
    cmd = f"robot -d {reports_dir} -i {tag} {tests_dir}"
    print(f"Executando: {cmd}")
    c.run(cmd)

@task
def test_exclude_tag(c, tag, reports_dir=DEFAULT_REPORTS_DIR, tests_dir=DEFAULT_TESTS_DIR):
    """Executa testes excluindo uma tag específica"""
    cmd = f"robot -d {reports_dir} -e {tag} {tests_dir}"
    print(f"Executando: {cmd}")
    c.run(cmd)

@task
def test_pr(c, reports_dir=DEFAULT_REPORTS_DIR, tests_dir=DEFAULT_TESTS_DIR, processes=DEFAULT_PROCESSES):
    """Executa testes para Pull Request (smoke tests em paralelo)"""
    cmd = (f"pabot --processes {processes} -d {reports_dir} --output output.xml "
           f"-v HEADLESS:true -v PIPELINE:true --nostatusrc -i smoke {tests_dir}")
    print(f"Executando: {cmd}")
    c.run(cmd)

@task
def test_regression(c, reports_dir=DEFAULT_REPORTS_DIR, tests_dir=DEFAULT_TESTS_DIR, processes=DEFAULT_PROCESSES):
    """Executa testes de regressão (todos os testes em paralelo)"""
    cmd = (f"pabot --processes {processes} -d {reports_dir} --output output.xml "
           f"-v HEADLESS:true -v PIPELINE:true --nostatusrc {tests_dir}")
    print(f"Executando: {cmd}")
    c.run(cmd)

@task
def test_parallel(c, tag=None, reports_dir=DEFAULT_REPORTS_DIR, tests_dir=DEFAULT_TESTS_DIR, processes=DEFAULT_PROCESSES):
    """Executa testes em paralelo com opção de tag"""
    tag_option = f"-i {tag}" if tag else ""
    cmd = f"pabot --processes {processes} -d {reports_dir} {tag_option} {tests_dir}"
    print(f"Executando: {cmd}")
    c.run(cmd)

@task
def test_suite(c, suite, reports_dir=DEFAULT_REPORTS_DIR, tests_dir=DEFAULT_TESTS_DIR):
    """Executa uma suite específica"""
    cmd = f"robot -d {reports_dir} -s {suite} {tests_dir}"
    print(f"Executando: {cmd}")
    c.run(cmd)

@task
def test_custom(c, args="", reports_dir=DEFAULT_REPORTS_DIR, tests_dir=DEFAULT_TESTS_DIR):
    """Executa testes com argumentos customizados"""
    cmd = f"robot -d {reports_dir} {args} {tests_dir}"
    print(f"Executando: {cmd}")
    c.run(cmd)

@task
def clean_reports(c, reports_dir=DEFAULT_REPORTS_DIR):
    """Limpa o diretório de relatórios"""
    if os.path.exists(reports_dir):
        c.run(f"rm -rf {reports_dir}/*")
        print(f"Diretório {reports_dir} limpo")
    else:
        print(f"Diretório {reports_dir} não existe")

@task
def setup_reports(c, reports_dir=DEFAULT_REPORTS_DIR):
    """Cria o diretório de relatórios se não existir"""
    c.run(f"mkdir -p {reports_dir}")
    print(f"Diretório {reports_dir} criado/verificado")

@task(pre=[setup_reports])
def test_with_setup(c, reports_dir=DEFAULT_REPORTS_DIR, tests_dir=DEFAULT_TESTS_DIR):
    """Executa todos os testes com setup automático do diretório"""
    test_all(c, reports_dir, tests_dir)

@task
def test_debug(c, test_name, reports_dir=DEFAULT_REPORTS_DIR, tests_dir=DEFAULT_TESTS_DIR):
    """Executa um teste específico em modo debug"""
    cmd = f"robot -d {reports_dir} -t '{test_name}' -L DEBUG {tests_dir}"
    print(f"Executando: {cmd}")
    c.run(cmd)

@task
def test_robot_metrics(c, reports_dir=DEFAULT_REPORTS_DIR, tests_dir=DEFAULT_TESTS_DIR):
    cmd = f"robotmetrics --input {reports_dir} --output output.xml --metrics-report-name index.html"
    print(f"Executando: {cmd}")
    c.run(cmd)

@task
def help_tasks(c):
    """Mostra exemplos de uso das tasks"""
    examples = """
    Exemplos de uso:

    # Executar todos os testes
    invoke test-all

    # Executar smoke tests
    invoke test-smoke

    # Executar testes com tag específica
    invoke test-tag --tag=critical

    # Executar testes excluindo uma tag
    invoke test-exclude-tag --tag=slow

    # Executar testes para PR
    invoke test-pr

    # Executar regressão
    invoke test-regression

    # Executar em paralelo com tag
    invoke test-parallel --tag=smoke --processes=8

    # Executar suite específica
    invoke test-suite --suite="Login Tests"

    # Executar com argumentos customizados
    invoke test-custom --args="-v BROWSER:chrome -i critical"

    # Limpar relatórios
    invoke clean-reports

    # Executar teste específico em debug
    invoke test-debug --test-name="Login com credenciais válidas"

    # Usar diretórios customizados
    invoke test-all --reports-dir=./custom-reports --tests-dir=./custom-tests
    """
    print(examples)