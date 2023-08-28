package net.flyclass.forum.domain;

public class Relation {
    private  int id;
    private  int userId;
    private int followerId;
    private  int relationType;

    @Override
    public String toString() {
        return "Relation{" +
                "id=" + id +
                ", userId=" + userId +
                ", followerId=" + followerId +
                ", relationType=" + relationType +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getFollowerId() {
        return followerId;
    }

    public void setFollowerId(int followerId) {
        this.followerId = followerId;
    }

    public int getRelationType() {
        return relationType;
    }

    public void setRelationType(int relationType) {
        this.relationType = relationType;
    }


}
