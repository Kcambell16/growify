import {Injectable} from "@angular/core";
import {Http} from "@angular/http";
import {Observable} from "rxjs/Observable";
import {BaseService} from "./base-service";
import {Profile} from "../classes/profile";

@Injectable()
export class ProfileService extends BaseService {
	constructor(protected http: Http){
		super(http);
	}

	private profileUrl = "api/profile/";

	getProfileByUsername(profileUsername: string) : Observable<Profile>{

	return(this.http.get(this.profileUrl+"?profileUserInput="+profileUsername)
		.map(this.extractData)
		.catch(this.handleError));

}

	getProfileByEmail(profileEmail: string) : Observable<Profile>{

		return(this.http.get(this.profileUrl+"?profileUserInput="+profileEmail)
			.map(this.extractData)
			.catch(this.handleError));

	}
	createProfile(profile: Profile) : Observable<Profile>{

		return(this.http.post(this.profileUrl, profile)
			.map(this.extractMessage)
			.catch(this.handleError));

	}
	updateProfile(profile: Profile) : Observable<Profile>{

		return(this.http.put(this.profileUrl + profile.profileId, profile)
			.map(this.extractMessage)
			.catch(this.handleError));

	}
	deleteProfile(profile: Profile) : Observable<Profile>{

		return(this.http.delete(this.profileUrl + profile.profileId)
			.map(this.extractMessage)
			.catch(this.handleError));
	}
}
