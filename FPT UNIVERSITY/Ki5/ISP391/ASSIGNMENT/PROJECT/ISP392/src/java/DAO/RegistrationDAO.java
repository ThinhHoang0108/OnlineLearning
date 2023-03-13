///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package DAO;
//
///**
// *
// * @author dell
// */
//import context.DBContext;
//import model.RegistrationDTO;
//import dao.AccountDAO;
//import dao.SubjectDAO;
//import java.io.Serializable;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import java.util.List;
//import model.RegistrationBuilder;
//import util.DBContext;
//
///**
// *
// * @author yentt
// */
//public class RegistrationDAO extends DBContext implements Serializable {
//
//    Connection con = null;
//    PreparedStatement pst = null;
//    ResultSet rs = null;
//
//    public List<RegistrationDTO> getRegistrationByAccount(int AccountId) {
//        List<RegistrationDTO> registrationDTOs = new ArrayList<>();
//        try {
//            con = DBContext.makeConnection();
//            if (con != null) {
//                String sql = "select regisId, regis_Date, statis, subId, priceId, userId\n"
//                        + "from Registration_Subject\n"
//                        + "where userId = ?";
//                pst = con.prepareStatement(sql);
//                pst.setInt(1, AccountId);
//                rs = pst.executeQuery();
//                while (rs.next()) {
//
//                    RegistrationDTO registrationDTO = new RegistrationDTO();
//                    registrationDTO.setRegisId(rs.getInt(1));
//                    registrationDTO.setRegisDate(rs.getString(2));
//                    registrationDTO.setStatus(rs.getBoolean(3));
//                    SubjectDAO subjectDAO = new SubjectDAO();
//                    registrationDTO.setSubject(subjectDAO.getSubjectById(rs.getInt(4)));
//                    PricePackageDAO pricePackageDAO = new PricePackageDAO();
//                    registrationDTO.setPricePackage(pricePackageDAO.getPricePackageById(rs.getInt(5)));
//                    AccountDAO accountDAO = new AccountDAO();
//                    registrationDTO.setAccount(accountDAO.getAccountById(AccountId));
//                    registrationDTOs.add(registrationDTO);
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                if (con != null) {
//                    con.close();
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//        return registrationDTOs;
//    }
//
//    public int getTotalMonthPrice(int currentYear) {
//        try {
//            con = DBContext.makeConnection();
//            if (con != null) {
//                String sql = "select SUM(salePrice) as TOTAL\n"
//                        + "from Registration_Subject\n"
//                        + "inner join Subject on Registration_Subject.subId = Subject.subjectId\n"
//                        + "right join PricePackage on Registration_Subject.priceId = PricePackage.priceId\n"
//                        + "Where Month(regis_Date) = Month(getDate()) and YEAR(regis_Date) = ?";
////                        + "Where Registration_Subject.regis_Date < DATEADD(DAY,-30,GETDATE())";
//                pst = con.prepareStatement(sql);
//                pst.setInt(1, currentYear);
//                rs = pst.executeQuery();
//                if (rs.next()) {
//                    return rs.getInt("TOTAL");
//                }
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                if (con != null) {
//                    con.close();
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//        return 0;
//    }
//
//    public Object getTotalPrice() {
//        try {
//            con = DBContext.makeConnection();
//            if (con != null) {
//                String sql = "select SUM(salePrice) as TOTAL\n"
//                        + "from Registration_Subject\n"
//                        + "inner join Subject on Registration_Subject.subId = Subject.subjectId\n"
//                        + "right join PricePackage on Registration_Subject.priceId = PricePackage.priceId";
//                pst = con.prepareStatement(sql);
//                rs = pst.executeQuery();
//                if (rs.next()) {
//                    return rs.getInt("TOTAL");
//                }
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                if (con != null) {
//                    con.close();
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//        return 0;
//    }
//
//    public int getTotalPriceEachMonth(int month, int year) {
//        try {
//            con = DBContext.makeConnection();
//            if (con != null) {
//                String sql = "select SUM(salePrice) as TOTAL\n"
//                        + "from Registration_Subject\n"
//                        + "inner join Subject on Registration_Subject.subId = Subject.subjectId\n"
//                        + "right join PricePackage on Registration_Subject.priceId = PricePackage.priceId\n"
//                        + "Where Month(regis_Date) = ? and YEAR(regis_Date) = ?";
//                pst = con.prepareStatement(sql);
//                pst.setInt(1, month);
//                pst.setInt(2, year);
//                rs = pst.executeQuery();
//                if (rs.next()) {
//                    return rs.getInt("TOTAL");
//                }
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                if (con != null) {
//                    con.close();
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//        return 0;
//    }
//
//    public List<RegistrationBuilder> getListYear() {
//        List<RegistrationBuilder> list = new ArrayList<>();
//        try {
//            con = DBContext.makeConnection();
//            if (con != null) {
//                String sql = "select distinct YEAR(regis_Date) from Registration_Subject";
//                pst = con.prepareStatement(sql);
//                rs = pst.executeQuery();
//                while (rs.next()) {
//                    RegistrationBuilder registrationBuilder = RegistrationBuilder.builder()
//                            .year(rs.getInt(1))
//                            .build();
//                    list.add(registrationBuilder);
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                if (con != null) {
//                    con.close();
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//        return list;
//    }
//}
