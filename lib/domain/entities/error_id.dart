enum ExceptionId {
  notEnoughFunds,
  notEnoughLots,
  userIsAlreadyExists,
  unknown,
  database,
  failedAuth,
  forbidden,
  serverError,
  userNotFound,
  currencyNotFound,
  investInstrumentNotFound,
  accountNotFound,
}

const instrumentTypesMap = {
  'notEnoughFunds': ExceptionId.notEnoughFunds,
  'notEnoughLots': ExceptionId.notEnoughLots,
  'userIsAlreadyExists': ExceptionId.userIsAlreadyExists,
  'unknown': ExceptionId.unknown,
  'database': ExceptionId.database,
  'failedAuth': ExceptionId.failedAuth,
  'forbidden': ExceptionId.forbidden,
  'serverError': ExceptionId.serverError,
  'userNotFound': ExceptionId.userNotFound,
  'currencyNotFound': ExceptionId.currencyNotFound,
  'investInstrumentNotFound': ExceptionId.investInstrumentNotFound,
  'accountNotFound': ExceptionId.accountNotFound,
};
