/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package consola;

import rest.modelo.dao.ReporteDao;
import rest.modelo.daoimpl.ReporteDaoImpl;
import rest.modelo.entidad.Permiso;



/**
 *
 * @author LEYDI
 */
public class Consola {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Consola c= new Consola();
        c.listarcity();
    }
    
    public void listarcity(){
       ReporteDao ci= new ReporteDaoImpl();
       
      if(ci.cantidad()!=0){
          System.out.println("cantidad"+ci.cantidad());
          
      }
    }
    
}
