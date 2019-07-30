

curl --user 'automation':'automation' -X POST -H "Accept:application/json" -H "Content-Type:application/json" "https://dev81019.service-now.com/api/now/table/incident" --data "{'u_affected_user':'automation,automation','u_affected_category':'Infrastructure','impact':'3','u_environment':'production','urgency':'2','assignment_group':'SystemAdministrators','short_description':'Job:Job_dir:Hostname:Group:Status:Date:Input File:Output File:Error File:','description':'Job:Job_dir:Hostname:Group:Status:Date:Input File:Output File:Error File:'}"
