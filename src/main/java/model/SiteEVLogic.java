package model;

public class SiteEVLogic {
  public void like(SiteEV site,User user) {
    int count = site.getLike();
    site.setLike(count + 1);
    site.setGoodList(user.getName());
  }

  public void dislike(SiteEV site,User user) {
    int count = site.getDislike();
    site.setDislike(count + 1);
    site.setBadList(user.getName());
  }
}