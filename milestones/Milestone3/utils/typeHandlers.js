const isTypeString = (argument) => {
    return (typeof argument === "string" || argument instanceof String) ? 
    true : false;
  };
  
  const isNumeric = (str) => {
    if (typeof str != "string") 
      return false  
  
    return !isNaN(str) && !isNaN(parseFloat(str));
  };
  
  module.exports = {
    isTypeString,
    isNumeric
  };