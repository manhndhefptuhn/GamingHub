<%-- 
    Document   : SaleComponentList
    Created on : 16-07-2023, 20:03:11
    Author     : Zarius
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Sale Component List</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="<%= request.getContextPath()%>/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="SaleNavigation.jsp" %>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Component List</h1>
                    <div class="card mb-4">
                        <div class="card-body">
                            <c:if test="${notification != null}">
                                <div>
                                    <strong style="color: greenyellow;">${notification}</strong>
                                </div>
                            </c:if>
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Type</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${not empty listMainboard}">
                                        <c:forEach var="mainboard" items="${listMainboard}">
                                            <tr>
                                                <td>${mainboard.getMainboardID()}</td>
                                                <td>${mainboard.getMainboardName()}</td>
                                                <td>${mainboard.getPrice()}</td>
                                                <td>Mainboard</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${mainboard.isStatus() == true}">
                                                            <c:out value="Active"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:out value="Deactive"/>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <a href="componentdetail?type=mainboard&id=<c:out value="${mainboard.getMainboardID()}" />">View</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${not empty listCPU}">
                                        <c:forEach var="cpu" items="${listCPU}">
                                            <tr>
                                                <td>${cpu.getCpuID()}</td>
                                                <td>${cpu.getCpuName()}</td>
                                                <td>${cpu.getPrice()}</td>
                                                <td>CPU</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${cpu.isStatus() == true}">
                                                            <c:out value="Active"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:out value="Deactive"/>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <a href="componentdetail?type=cpu&id=<c:out value="${cpu.getCpuID()}" />">View</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${not empty listCase}">
                                        <c:forEach var="listCase" items="${listCase}">
                                            <tr>
                                                <td>${listCase.getCaseID()}</td>
                                                <td>${listCase.getCaseName()}</td>
                                                <td>${listCase.getPrice()}</td>
                                                <td>Case</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${listCase.isStatus() == true}">
                                                            <c:out value="Active"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:out value="Deactive"/>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <a href="componentdetail?type=case&id=<c:out value="${listCase.getCaseID()}" />">View</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${not empty listPSU}">
                                        <c:forEach var="psu" items="${listPSU}">
                                            <tr>
                                                <td>${psu.getPsuID()}</td>
                                                <td>${psu.getPsuName()}</td>
                                                <td>${psu.getPrice()}</td>
                                                <td>PSU</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${psu.isStatus() == true}">
                                                            <c:out value="Active"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:out value="Deactive"/>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <a href="componentdetail?type=psu&id=<c:out value="${psu.getPsuID()}" />">View</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${not empty listRAM}">
                                        <c:forEach var="ram" items="${listRAM}">
                                            <tr>
                                                <td>${ram.getRamID()}</td>
                                                <td>${ram.getRamName()}</td>
                                                <td>${ram.getPrice()}</td>
                                                <td>RAM</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${ram.isStatus() == true}">
                                                            <c:out value="Active"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:out value="Deactive"/>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <a href="componentdetail?type=ram&id=<c:out value="${ram.getRamID()}" />">View</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${not empty listStorage}">
                                        <c:forEach var="storage" items="${listStorage}">
                                            <tr>
                                                <td>${storage.getStorageID()}</td>
                                                <td>${storage.getStorageName()}</td>
                                                <td>${storage.getPrice()}</td>
                                                <td>Storage</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${storage.isStatus() == true}">
                                                            <c:out value="Active"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:out value="Deactive"/>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <a href="componentdetail?type=storage&id=<c:out value="${storage.getStorageID()}" />">View</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${not empty listVGA}">
                                        <c:forEach var="vga" items="${listVGA}">
                                            <tr>
                                                <td>${vga.getVgaID()}</td>
                                                <td>${vga.getVgaName()}</td>
                                                <td>${vga.getPrice()}</td>
                                                <td>VGA</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${vga.isStatus() == true}">
                                                            <c:out value="Active"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:out value="Deactive"/>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <a href="componentdetail?type=vga&id=<c:out value="${vga.getVgaID()}" />">View</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </main>
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright &copy; Gaming Hub 2023</div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="<%= request.getContextPath()%>/js/scripts1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    <script src="<%= request.getContextPath()%>/js/datatables-simple-demo1.js"></script>
</body>
</html>
