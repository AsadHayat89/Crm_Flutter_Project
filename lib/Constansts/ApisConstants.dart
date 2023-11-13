class ApiConstans{
  static String BaseUrl="http://192.168.43.69:3000";
  static String imageEmployeeBaseUrl="http://192.168.43.69:3000/images/EmployeeImage/";
  static String imageCutomerBaseUrl="http://192.168.43.69:3000/images/CustomerImages/";
  static String imageDealBaseUrl="http://192.168.43.69:3000/images/Deal/";
  static String imageInvetryBaseUrl="http://192.168.43.69:3000/images/Inventry/";


  static String LoginUrl="/api/login";
  static String SignUpUrl="/api/signup";

  static String addInventry='/api/AddInventry';
  static String getInventry='/api/Inventry';

  static String getExpensedata='/api/expenses/total/current-month';

  static String addEmployeeUrl='/api/Addemployee';
  static String getAllEmployees='/api/employees';
  static String deleteEmployee='/api/employee';

  static String getAllExpense='/api/expenses';

  static String addExpenses='/api/expenses';

  static String addDeal='/api/deals';
  static String getProfit='/api/Profit';

  static String getProfitDetail='/api/getMonthlyProfit';

  static String addCutomer='/api/Addcutomer';
  static String getAllCutomer='/api/Customer';
}