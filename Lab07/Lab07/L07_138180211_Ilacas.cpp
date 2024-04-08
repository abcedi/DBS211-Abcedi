#include <iostream> 
#include <occi.h>

using oracle::occi::Environment;
using oracle::occi::Connection;
using oracle::occi::Statement;
using oracle::occi::ResultSet;
using namespace oracle::occi;
using namespace std;

int main(void) {
    // OCCI Variables
    Environment* env = nullptr;
    Connection* conn = nullptr;
    // User Variables
    string str;
    string usr = "dbs211_241nbb11";
    string pass = "21903207";
    string srv = "myoracle12c.senecacollege.ca:1521/oracle12c";

    try {
        env = Environment::createEnvironment(Environment::DEFAULT);
        conn = env->createConnection(usr, pass, srv);
        cout << "Connection is Successful!" << endl;
        cout << endl;
        
        cout<< "Display details of all Employees who work in San Francisco:" << endl;
        Statement* stmt1 = conn->createStatement(
            "SELECT EMPLOYEENUMBER, FIRSTNAME, LASTNAME, PHONE, EXTENSION "
            "FROM RETAILEMPLOYEES RE "
            "JOIN RETAILOFFICES RO ON RE.OFFICECODE = RO.OFFICECODE "
            "WHERE RO.CITY = 'San Francisco' "
            "ORDER BY EMPLOYEENUMBER"
        );
        ResultSet* rs1 = stmt1->executeQuery();
        while (rs1->next()) {
            cout << rs1->getInt(1) << " " << rs1->getString(2) << " "
                << rs1->getString(3) << " " << rs1->getString(4) << " "
                << rs1->getString(5) << endl;
        }
        cout << endl;
        conn->terminateStatement(stmt1);

        cout << "Display details for all managers:" << endl;
        Statement* stmt2 = conn->createStatement(
            "SELECT DISTINCT MANAGER.EMPLOYEENUMBER, MANAGER.LASTNAME, "
            "RO.PHONE, MANAGER.EXTENSION "
            "FROM RETAILEMPLOYEES MANAGER "
            "JOIN RETAILEMPLOYEES EMPLOYEE ON MANAGER.EMPLOYEENUMBER = EMPLOYEE.REPORTSTO "
            "JOIN RETAILOFFICES RO ON MANAGER.OFFICECODE = RO.OFFICECODE"
        );
        ResultSet* rs2 = stmt2->executeQuery();
        while (rs2->next()) {
            cout << rs2->getInt(1) << " " << rs2->getString(2) << " "
                << rs2->getString(3) << " " << rs2->getString(4) << endl;
        }
        conn->terminateStatement(stmt2);

        // Terminate the connection and the environment
        env->terminateConnection(conn);
        Environment::terminateEnvironment(env);
    }
    catch (SQLException& sqlExcp) {
        cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage() << endl;
    }

    return 0;
}