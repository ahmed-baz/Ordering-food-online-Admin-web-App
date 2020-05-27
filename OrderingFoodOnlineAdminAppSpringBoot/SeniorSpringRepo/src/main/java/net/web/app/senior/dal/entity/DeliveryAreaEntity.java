package net.web.app.senior.dal.entity;
// Generated Feb 3, 2020 1:56:25 AM by Hibernate Tools 4.3.1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * DeliveryArea generated by hbm2java
 */
@Entity
@Table(name = "delivery_area",
         catalog = "senior_app"
)
public class DeliveryAreaEntity implements java.io.Serializable {

    private Integer id;
    private AreaEntity area;
    private BranchEntity branch;
    private float deliveryFees;
    private int deliverInMinutes;

    public DeliveryAreaEntity() {
    }

    public DeliveryAreaEntity(AreaEntity area, BranchEntity branch, float deliveryFees, int deliverInMinutes) {
        this.area = area;
        this.branch = branch;
        this.deliveryFees = deliveryFees;
        this.deliverInMinutes = deliverInMinutes;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "area_id", nullable = false)
    public AreaEntity getArea() {
        return this.area;
    }

    public void setArea(AreaEntity area) {
        this.area = area;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "branch_id", nullable = false)
    public BranchEntity getBranch() {
        return this.branch;
    }

    public void setBranch(BranchEntity branch) {
        this.branch = branch;
    }

    @Column(name = "delivery_fees", nullable = false, precision = 12, scale = 0)
    public float getDeliveryFees() {
        return this.deliveryFees;
    }

    public void setDeliveryFees(float deliveryFees) {
        this.deliveryFees = deliveryFees;
    }

    @Column(name = "deliver_in_minutes", nullable = false)
    public int getDeliverInMinutes() {
        return this.deliverInMinutes;
    }

    public void setDeliverInMinutes(int deliverInMinutes) {
        this.deliverInMinutes = deliverInMinutes;
    }

}