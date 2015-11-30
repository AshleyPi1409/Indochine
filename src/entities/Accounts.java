package entities;
// Generated Nov 19, 2015 12:30:29 AM by Hibernate Tools 4.3.1

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Accounts generated by hbm2java
 */
@Entity
@Table(name = "Accounts", schema = "dbo", catalog = "Hotel"
)
public class Accounts implements java.io.Serializable {

    private Integer accountId;
    private Roles roles;
    private String accountName;
    private String accountPass;
    private Boolean isActive;
    private Set<Diary> diaries = new HashSet<Diary>(0);
    private Set<BookingRoom> bookingRooms = new HashSet<BookingRoom>(0);
    private Set<OrderForSupplier> orderForSuppliers = new HashSet<OrderForSupplier>(0);
    private Set<RestaurantBill> restaurantBills = new HashSet<RestaurantBill>(0);
    private Set<OrderedService> orderedServices = new HashSet<OrderedService>(0);
    private Set<OrderTable> orderTables = new HashSet<OrderTable>(0);

    public Accounts() {
    }

    public Accounts(Roles roles, String accountName, String accountPass, Boolean isActive, Set<Diary> diaries, Set<BookingRoom> bookingRooms, Set<OrderForSupplier> orderForSuppliers, Set<RestaurantBill> restaurantBills, Set<OrderedService> orderedServices, Set<OrderTable> orderTables) {
        this.roles = roles;
        this.accountName = accountName;
        this.accountPass = accountPass;
        this.isActive = isActive;
        this.diaries = diaries;
        this.bookingRooms = bookingRooms;
        this.orderForSuppliers = orderForSuppliers;
        this.restaurantBills = restaurantBills;
        this.orderedServices = orderedServices;
        this.orderTables = orderTables;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)

    @Column(name = "AccountID", unique = true, nullable = false)
    public Integer getAccountId() {
        return this.accountId;
    }

    public void setAccountId(Integer accountId) {
        this.accountId = accountId;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "RoleID")
    public Roles getRoles() {
        return this.roles;
    }

    public void setRoles(Roles roles) {
        this.roles = roles;
    }

    @Column(name = "AccountName")
    public String getAccountName() {
        return this.accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    @Column(name = "AccountPass")
    public String getAccountPass() {
        return this.accountPass;
    }

    public void setAccountPass(String accountPass) {
        this.accountPass = accountPass;
    }

    @Column(name = "isActive")
    public Boolean getIsActive() {
        return this.isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "accounts")
    public Set<Diary> getDiaries() {
        return this.diaries;
    }

    public void setDiaries(Set<Diary> diaries) {
        this.diaries = diaries;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "accounts")
    public Set<BookingRoom> getBookingRooms() {
        return this.bookingRooms;
    }

    public void setBookingRooms(Set<BookingRoom> bookingRooms) {
        this.bookingRooms = bookingRooms;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "accounts")
    public Set<OrderForSupplier> getOrderForSuppliers() {
        return this.orderForSuppliers;
    }

    public void setOrderForSuppliers(Set<OrderForSupplier> orderForSuppliers) {
        this.orderForSuppliers = orderForSuppliers;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "accounts")
    public Set<RestaurantBill> getRestaurantBills() {
        return this.restaurantBills;
    }

    public void setRestaurantBills(Set<RestaurantBill> restaurantBills) {
        this.restaurantBills = restaurantBills;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "accounts")
    public Set<OrderedService> getOrderedServices() {
        return this.orderedServices;
    }

    public void setOrderedServices(Set<OrderedService> orderedServices) {
        this.orderedServices = orderedServices;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "accounts")
    public Set<OrderTable> getOrderTables() {
        return this.orderTables;
    }

    public void setOrderTables(Set<OrderTable> orderTables) {
        this.orderTables = orderTables;
    }

}