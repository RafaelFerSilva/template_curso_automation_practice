*** Variables ***
${FILTER_SEARCH}=               data-testid=input-search
${FILTER_DEPARTMENT}=           data-testid=select-department-filter
${FILTER_STATUS}=               data-testid=select-status-filter
${PAGE_SIZE}=                   data-testid=select-page-size

${BTN_ADD_USER}=                data-testid=btn-add-user
${BTN_CLEAR_FILTERS}=           data-testid=btn-edit-clear-filters
${BTN_EXPORT_DATA}=             data-testid=btn-edit-export-data
${BTN_IMPORT_DATA}=             data-testid=btn-edit-import-data

${TABLE_USERS}=                 data-testid=table-users

${TABLE_HEAD}=                  data-testid=table-header-users
${CHECK_BOX_SELECT_ALL}=        ${TABLE_HEAD} >> data-testid=checkbox-select-all
${TABLE_HEAD_BTN_EDIT_SORT}=    data-testid=btn-edit-sort-

${TABLE_ROW}=                   //span[contains(@data-testid, "stats-value-user-email") and text()="$$"]//ancestor::tr
${TABLE_CELL_ITEM}=             //span[contains(@data-testid, "stats-value-user-$$") and text()="$$"]
${TABLE_CELL_CHECKBOX}=         //button[contains(@data-testid,"checkbox-select-user")]
${TABLE_CELL_BADGE_STATUS}=     //div[contains(@data-testid, "badge-user-status") and text()="$$"]
${TABLE_CELL_BUTTONS}=          //button[contains(@data-testid,"btn-$$-user")]

${TABLE_ROWNS_SIZE}=            [data-testid="table-users"] >> tr[data-testid^="table-row-user"]

${DROPDOWN_SELECT_COUNTENT}=    data-testid=select-content
