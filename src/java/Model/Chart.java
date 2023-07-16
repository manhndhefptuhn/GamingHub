package Model;

import java.sql.Date;

public class Chart {
    private Date date;
    private int value;
    
    public Chart(){
        
    }
    
    public Chart(ChartBuilder builder) {
        this.date = builder.date;
        this.value = builder.value;
    }

    public Date getDate() {
        return date;
    }

    public int getValue() {
        return value;
    }

    @Override
    public String toString() {
        return "Chart{" +
                "date=" + date +
                ", value=" + value +
                '}';
    }

    public class ChartBuilder {
        private Date date;
        private int value;
        
        public ChartBuilder(){
            
        }

        public ChartBuilder date(Date date) {
            this.date = date;
            return this;
        }

        public ChartBuilder value(int value) {
            this.value = value;
            return this;
        }

        public Chart build() {
            return new Chart(this);
        }
    }
}