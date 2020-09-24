/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mx.examen.Controllers;

import com.mx.examen.Conecction.mainConecction;
import com.mx.examen.Entities.userEntity;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author César Huerta
 */
@Controller
public class mainController {

    /*
    Variables globales
     */
    mainConecction con = new mainConecction();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(con.Connect());
    ModelAndView mav = new ModelAndView();
    int id;
    List data;

    /*
    Metodo para listar los valores solicitados de la base de datos
     */
    @RequestMapping("index.htm")
    public ModelAndView List() {

        String sql = "SELECT * from usuarios";
        data = this.jdbcTemplate.queryForList(sql);
        mav.addObject("list", data);
        mav.setViewName("index");
        return mav;
    }
    /*
    Metodo para crear un formulario de registro
     */
    @RequestMapping(value = "add.htm", method = RequestMethod.GET)
    public ModelAndView add() {
        mav.addObject(new userEntity());
        mav.setViewName("add");
        return mav;
    }
    /*
    Metodo para agregar un nuevo registro
     */
    @RequestMapping(value = "add.htm", method = RequestMethod.POST)
    public ModelAndView add(userEntity usr){
        String sql = "insert into usuarios(nombre,curp,nacimiento,edad,correo,telefono)values(?,?,?,?,?,?)";
        jdbcTemplate.update(sql,
                usr.getNombre(),
                usr.getCurp(),
                usr.getNacimiento(),
                usr.getEdad(),
                usr.getCorreo(),
                usr.getTelefono());
        
        return new ModelAndView("redirect:/index.htm");
    }
    /*
    Metodo para agregar un nuevo registro
     */
    @RequestMapping(value = "edit.htm", method = RequestMethod.GET)
    public ModelAndView edit(HttpServletRequest request) {
        id = Integer.parseInt(request.getParameter("id"));
        String sql = "select * from usuarios where id=" + id;
        data = this.jdbcTemplate.queryForList(sql);
        mav.addObject("list", data);
        mav.setViewName("edit");
        return mav;
    }

    /*
    Metodo para agregar un nuevo registro
     */
    @RequestMapping(value = "edit.htm", method = RequestMethod.POST)
    public ModelAndView edit(userEntity usr) {
        String sql = "update usuarios set nombre=?,curp=?,nacimiento=?,edad=?,correo=?,telefono=? where id=" + id;
        this.jdbcTemplate.update(sql, usr.getNombre(), usr.getCurp(), usr.getNacimiento(), usr.getEdad(), usr.getCorreo(), usr.getTelefono());
        return new ModelAndView("redirect:/index.htm");
    }

    /*
    Metodo para agregar un nuevo registro
     */
    @RequestMapping("delete.htm")
    public ModelAndView delete(HttpServletRequest request) {
        id = Integer.parseInt(request.getParameter("id"));
        String sql = "delete from usuarios where id=" + id;
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/index.htm");

    }
}
