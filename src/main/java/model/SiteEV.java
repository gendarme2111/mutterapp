package model;

import java.util.ArrayList;
import java.util.List;

public class SiteEV {
  private int like; // よいねの数
  private int dislike; // よくないねの数
  List<String> goodList;
  List<String> badList;

  public SiteEV() {
    like = 0;
    dislike = 0;
    goodList= new ArrayList();
    badList= new ArrayList();
  }

  public int getLike() {
    return like;
  }

  public void setLike(int like) {
    this.like = like;
  }

  public int getDislike() {
    return dislike;
  }

  public void setDislike(int dislike) {
    this.dislike = dislike;
  }

  public List<String> getGoodList(){
	  return this.goodList;
  }

  public void setGoodList(String name) {
  	goodList.add(name);
  }

  public List<String> getBadList(){
	  return this.badList;
  }

  public void setBadList(String name) {
  	badList.add(name);
  }
}