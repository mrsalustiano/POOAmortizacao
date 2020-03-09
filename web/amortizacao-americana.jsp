<%-- 
    Document   : price
    Created on : 01/03/2020, 21:38:30
    Author     : Anna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Americana</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" crossorigin="anonymous" >
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 
        <style>
            @import url('https://fonts.googleapis.com/css?family=Nunito&display=swap');
            html {
                font-family: 'Nunito', sans-serif;
                -webkit-font-smoothing: antialiased;
                min-height: 100%;
            }
            *{ text-align: center;
              
            }
           
            body {
                height: 100%;
                margin: 0;
                background: #00FFFF;
                background: rgb(0, 185, 241);  /* fallback for old browsers */
                background: -webkit-linear-gradient(to right, rgb(151, 236, 247), rgb(94, 221, 179));  /* Chrome 10-25, Safari 5.1-6 */
                background: linear-gradient(to right, rgb(119, 212, 139), rgb(7, 240, 240)); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                color: black;
                background-repeat: no-repeat;
            }
            .categories .card{ width: 43%; padding: 20px;  }
            .categories p { color: gray;   }
            .team .card { width: 15%; text-align: center; margin: 20px 20px;;  }
            .team .card h4 { margin: 0; font-size: 20px;  padding: 3px 0; text-align: center;  }
            .team, .categories { display: flex; justify-content: space-between;  flex-wrap: wrap;  }
            .team .card img { width: 100%; }
            .fa {font-size: 20px; padding: 0px 2px; }
            .categories h2 { margin: 0;  text-align: center; }
            #constante, #americana, #tabela_price, #inicio { cursor: pointer;  transition: all .2s ease-in-out;  }
            #constante:hover, #americana:hover, #tabela_price:hover, #inicio:hover{  transform: scale(1.1);  }
          
            h1 {  
                text-align: center;
                color: black;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
          
            .card, .balao {
                background-color: white;
                border-radius: 4px;
                box-shadow: 12px 12px 15px rgba(46, 61, 73, 0.4);
                color: #36304a;
            }
            .balao{
                width: 600px;
                padding: 10px;
                margin: 1% 30%;
            }
           

            .categories h2 {
                margin: 0;
                text-align: center;
            }
            
            #acesso {
                cursor: pointer;
                transition: all .2s ease-in-out;
            }
            
            #acesso:hover{
                transform: scale(1.1);
            }
            .profile{
                width: 200px;
                
            }
         
             .card {
                width: 220px;
                padding:  10px 10px;
                margin: 1% 40%;
            }
            .titulotime{
                background: -webkit-linear-gradient(45deg,#4B0082,#8B008B);
            }
            .tabelaAmericana{
                margin-left: 30%;
                border: 5px solid black;
                border-collapse: collapse;
                
            }
            .content{
                min-height: 100vh;
            }
             .container{
                display: flex;
                justify-content: center;
                padding-bottom: 40px;
              }
             .styled2 {
                  border: 0;
                  line-height: 2.4;
                  padding: 0 20px;
          
                  text-align: center;
                  align-content: center;
                  color: #fff;
                  text-shadow: 1px 1px 1px #000;
                  border-radius: 10px;
                  background-color: rgba(255, 40, 40, 1);
                  background-image: linear-gradient(to top left,
                      rgba(0, 0, 0, .2),
                      rgba(0, 0, 0, .2) 30%,
                      rgba(0, 0, 0, 0));
                  box-shadow: inset 2px 2px 3px rgba(255, 255, 255, .6),
                      inset -2px -2px 3px rgba(0, 0, 0, .6);
              }

              .styled2:hover {
                  background-color: rgba(133, 0, 2, 1);
              }

              .styled2:active {
                  box-shadow: inset -2px -2px 3px rgba(255, 255, 255, .6),
                      inset 2px 2px 3px rgba(0, 0, 0, .6);
              }
        </style>
    </head>
    <body>
        <div class="content">
       <%@include file="WEB-INF/jspf/header.jspf" %> 
    
        <%@include file="WEB-INF/jspf/menu.jspf" %> 
        
        <h1 style="padding: 20px 0;"> Amortização Americana</h1><br/>
        <% if (request.getParameter("enviar") == null) { %>
        
            <div class="container"> 
                <form method="post" class="form-group">


                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-default">Valor da divida:</span>
                        </div>
                        <input type="number" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" name="valorDivida">
                    </div> 
        
        
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-default">Quantidade das parcelas:</span>
                        </div>
                        <input type="number" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" name="nParcelas">
                    </div> 
           
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-default">Taxa:</span>
                        </div>
                        <input type="number" class="form-control" step="0.01" aria-label="Default" aria-describedby="inputGroup-sizing-default" name="taxa">
                    </div>  
      
            <input class="styled2" type="submit" name="enviar" value="Calcular"/>
        </form>
        <% } else { %>
       
        
        <%try {%>
        <%double divida = Double.parseDouble(request.getParameter("valorDivida"));%>
        <%double nParcelas = Double.parseDouble(request.getParameter("nParcelas"));%>
        <%double tax = Double.parseDouble(request.getParameter("taxa")); %>
        <%double parcela = 0;%>
        <%double montante = 0;%>
         
        <div class="container">
            <div>
            <table class="table table-striped">
            <tr class="bg-info">
               <th> N° Parcelas</th> 
                <th>Amortização</th>
                <th>Juros (<%=tax%> de <%=divida%>)</th>
                <th>Dívida</th>
                <th>Montante</th>
            </tr>
            <% for (int i = 0; i <= nParcelas +1 ; i++) {%>

            <tr >
                <td >
                    <% if(i <= nParcelas){%>
                    <%=i%>  
                    <%}else{%> -----
                    <% }%>
                </td>
                <td>
                    <% if (i < nParcelas) {%>
                    0
                    <%} else if(i==nParcelas) {%>
      
                    <%= divida%>
                    <%}else{%> -----
                    <% }%>
                </td>
                <td>
                    <% if(i == 0){%>0 <%} else if(i < nParcelas +1){ %>
                    <%parcela = (divida/100)*tax;%>
                    <%=parcela%>
                    <% montante = montante + parcela;%>
                    <% }else{ %> -----
                    <% }%>
                </td>
                <td>
                    <% if(i < nParcelas){%>
                    <%=divida%>
                    <% }else if(i == nParcelas){%>Total pago em juros:
                    <% }else{%> Total quitado:
                    <% }%>
                </td>
                <td>
                    <% if(i < nParcelas){%>   
                        <%=montante%>
                    <%}else if(i == nParcelas){%>
                    <%=montante%>
                    <%}else { %>
                    <% montante = montante + divida;%>
                    <%=montante%>
            </b>
                    <%}%>
                </td>
            </tr>
            <%}%>
        </table>
         </div>
        <%} catch (Exception ex) {%>
        <h3 style="color: red"><%= ex.getMessage()%></h3>
        <%}%>

        <% }%>
         </div>
            </div></div>
        </body>
       <%@include file="WEB-INF/jspf/footer.jspf" %>  
       
</html>

