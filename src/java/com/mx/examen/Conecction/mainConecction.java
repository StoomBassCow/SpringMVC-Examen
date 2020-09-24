/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mx.examen.Conecction;

import org.springframework.jdbc.datasource.DriverManagerDataSource;

/**
 *
 * @author César Huerta
 */
public class mainConecction {

    public DriverManagerDataSource Connect() {

        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/examen_eisei");
        dataSource.setUsername("root");
        dataSource.setPassword("root");
        
        return dataSource;
    }
}
