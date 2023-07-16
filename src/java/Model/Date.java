package Model;

import java.sql.*;

public class Date {

    private java.sql.Date start;
    private java.sql.Date end;

    public Date() {
    }

    public Date(java.sql.Date start, java.sql.Date end) {
        this.start = start;
        this.end = end;
    }

    public java.sql.Date getStart() {
        return start;
    }

    public void setStart(java.sql.Date start) {
        this.start = start;
    }

    public java.sql.Date getEnd() {
        return end;
    }

    public void setEnd(java.sql.Date end) {
        this.end = end;
    }

    @Override
    public String toString() {
        return "Date{" +
                "start=" + start +
                ", end=" + end +
                '}';
    }

    public class Builder {
        private java.sql.Date start;
        private java.sql.Date end;

        public Builder() {
        }
        

        public Builder setStart(java.sql.Date start) {
            this.start = start;
            return this;
        }

        public Builder setEnd(java.sql.Date end) {
            this.end = end;
            return this;
        }

        public Date build() {
            return new Date(start, end);
        }
    }
}
