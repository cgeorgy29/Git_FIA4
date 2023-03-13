import { Component } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { catchError, Observable, throwError } from 'rxjs';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
})
export class AppComponent {
  title = 'Flickr';
  copyright = "@Antoine Vigneron";
  tag = "";
  key = "212f8c935acc1281ab8553a1184b3022";
  photos : any;
  photo_courante: any;

  nouveau_mot_cle() : void {
    this.getPhotos().subscribe(resp => this.photos = resp.photos);
  }
    
  private handleError(error: HttpErrorResponse) {
    if (error.status === 0) {
      // Erreur client ou réseau.
      console.error('An error occurred:', error.error);
    } else {
      // Le backend a retourné un code d'erreur.
      // La réponse peut contenir un message d'erreur.
      console.error(
        `Erreur du backend avec code ${error.status}, le message est: `,
        error.error);
    }
    // Retour d'un observable avec un message d'erreur.
    return throwError(() => new Error('Something bad happened; please try again later.'));
    }
  
  private getPhotos(): Observable<any> {
    let url = "https://api.flickr.com/services/rest?" +
      "nojsoncallback=1&method=flickr.photos.search&api_key=" +
      this.key + "&tags=" + this.tag + "&format=json";
    return this.http.get(url).pipe(
      catchError(this.handleError)
    );
  }
  
  getPhotoUrl(photo : any) : string {
    return "http://farm"+photo.farm+".static.flickr.com/"+photo.server+"/"+photo.id+"_"+photo.secret+"_s.jpg"
  }    

  constructor(private http: HttpClient) { }

}



