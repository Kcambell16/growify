import {Component, ViewChild, OnInit} from "@angular/core";
import {ProfileService} from "../services/profile-service";
import {Router} from "@angular/router";
import {Profile} from "../classes/profile";
import {Status} from "../classes/status";

@Component({
	templateUrl: "./templates/signup.php",
	selector: "signup-component"
})

export class SignupComponent implements OnInit{
	@ViewChild("signUpForm") signUpForm : any;
	profileUsername: string = ""; // username from form
	profileEmail: string = ""; // email from form
	profileZipCode: string = ""; // zipcode from form
	profilePassword: string = ""; // password from form
	profile: Profile = new Profile(null, "", "", "","");
	testProfile: Profile = new Profile(null, "gbloom3", "87112", "gbloomdev@gmail.com", "abc123");
	status: Status = null;

	constructor(private profileService: ProfileService, private router: Router){}

	ngOnInit(): void {
	}

	createProfile() : void {

		this.profileService.postProfile(this.profile)
			.subscribe(status => {
				this.status = status;
				if(status.status === 200) {
					this.signUpForm.reset()
				}
			});
	}
}