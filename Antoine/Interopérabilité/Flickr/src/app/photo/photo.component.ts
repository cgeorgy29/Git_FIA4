import { Component } from '@angular/core';
import { Input } from '@angular/core';

@Component({
  selector: 'app-photo',
  templateUrl: './photo.component.html',
  styleUrls: ['./photo.component.css'],
})

export class PhotoComponent {
  @Input() photo : any;

  getPhotoUrl() : string{
    if (this.photo)
    return "http://farm"+this.photo.farm+".static.flickr.com/"+this.photo.server+"/"+this.photo.id+"_"+this.photo.secret+"_b.jpg"
    else return ""
  }

  onClick(){
    this.photo = null;
  }
}
