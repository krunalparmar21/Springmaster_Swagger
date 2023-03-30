package SpringMVC.Bean;


import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name = "Address")
public class Address {

	// Neddable variable fields
	@Id	
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Aid;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "user_fk")
	private User user;
	
	// @Column(nullable = false)
	private String Address1;
	// @Column(nullable = false)
	private String city;
	// @Column(nullable = false)
	private String state;
	private String area;
	// @Column(nullable = false)
	private String postalcode;

	@Transient
	private String AddressId;

	

	public Address() {
		// TODO Auto-generated constructor stub
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getAid() {
		return Aid;
	}

	public void setAid(int Aid) {
		this.Aid = Aid;
	}

	public String getAddress1() {
		return Address1;
	}

	public void setAddress1(String Address1) {
		this.Address1 = Address1;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getPostalcode() {
		return postalcode;
	}

	public void setPostalcode(String postalcode) {
		this.postalcode = postalcode;
	}

	public String getAddressId() {
		return AddressId;
	}

	public void setAddressId(String addressId) {
		AddressId = addressId;
	}

	public Address(int Aid ,String Address1, String city, String state, String area, String postalcode,User user) {
		super();
		this.Aid = Aid;
		this.Address1 = Address1;
		this.city = city;
		this.state = state;
		this.area = area;
		this.postalcode = postalcode;
		this.user = user;
		
	}

	@Override
	public String toString() {
		return "Address [Aid=" + Aid + ", Address1=" + Address1 + ", city=" + city + ", state=" + state + ", area="
				+ area + ", postalcode=" + postalcode + "]";
	}

}
