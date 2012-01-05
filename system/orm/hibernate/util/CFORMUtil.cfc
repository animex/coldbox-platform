﻿/**
********************************************************************************
Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldbox.org | www.luismajano.com | www.ortussolutions.com
********************************************************************************
Author      :	Luis Majano & Mike McKellip
Description :

This implementation supports multiple DSNs for ORM a-la Adobe ColdFusion 9

----------------------------------------------------------------------->
*/
component implements="coldbox.system.orm.hibernate.util.IORMUtil"{
			
	public void function flush(string datasource) {
		if(StructKeyExists(arguments,"datasource"))
			ORMFlush(arguments.datasource);
		else
			ORMFlush();
	}

	public any function getSession(string datasource) {
		if(StructKeyExists(arguments,"datasource"))
			return ORMGetSession(arguments.datasource);
		else
			return ORMGetSession();
	}
	
	public any function getSessionFactory(string datasource) {
		if(StructKeyExists(arguments,"datasource"))
			return ORMGetSessionFactory(arguments.datasource);
		else
			return ORMGetSessionFactory();
	}
	
	public void function clearSession(string datasource) {
		if(StructKeyExists(arguments,"datasource"))
			ORMClearSession(arguments.datasource);
		else
			ORMClearSession();
	}
	
	public void function closeSession(string datasource) {
		if(StructKeyExists(arguments,"datasource"))
			ORMCloseSession(arguments.datasource);
		else
			ORMCloseSession();
	}
	
	public void function evictQueries(string cachename, string datasource) {
		if(StructKeyExists(arguments,"cachename") AND StructKeyExists(arguments,"datasource")) 
			ORMEvictQueries(arguments.cachename, arguments.datasource);
		else if(StructKeyExists(arguments,"cachename"))
			ORMEvictQueries(arguments.cachename);
		else
			ORMEvictQueries();
	}
	
	/**
 	* Returns the datasource for a given entity
 	* @entity The entity reference. Can be passed as an object or as the entity name.
 	*/
 	public string function getEntityDatasource(required entity) {
 		// DEFAULT datasource
 		var datasource = application.getApplicationSettings().datasource;
 		
 		if(!IsObject(arguments.entity)) arguments.entity= EntityNew(arguments.entity);
 		
 		var md = getMetaData(arguments.entity);
 		if( StructKeyExists(md,"DATASOURCE") ) datasource = md.DATASOURCE;
 		
 		return datasource;
 	}

}