package net.flyclass.forum.domain;



public class speak {
    @Override
    public String toString() {
        return "speak{" +
                "id=" + id +
                ", sendId=" + sendId +
                ", receiverId=" + receiverId +
                ", connent='" + connent + '\'' +
                '}';
    }

    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSendId() {
        return sendId;
    }

    public void setSendId(int sendId) {
        this.sendId = sendId;
    }

    public int getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(int receiverId) {
        this.receiverId = receiverId;
    }

    public String getConnent() {
        return connent;
    }

    public void setConnent(String connent) {
        this.connent = connent;
    }

    private int sendId;
    private int receiverId;
    private String connent;
}
