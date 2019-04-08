package cn.edu.hbpu.bookstore.pojo;

import java.util.ArrayList;
import java.util.List;

public class DeliveryExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public DeliveryExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andAsidIsNull() {
            addCriterion("asid is null");
            return (Criteria) this;
        }

        public Criteria andAsidIsNotNull() {
            addCriterion("asid is not null");
            return (Criteria) this;
        }

        public Criteria andAsidEqualTo(Integer value) {
            addCriterion("asid =", value, "asid");
            return (Criteria) this;
        }

        public Criteria andAsidNotEqualTo(Integer value) {
            addCriterion("asid <>", value, "asid");
            return (Criteria) this;
        }

        public Criteria andAsidGreaterThan(Integer value) {
            addCriterion("asid >", value, "asid");
            return (Criteria) this;
        }

        public Criteria andAsidGreaterThanOrEqualTo(Integer value) {
            addCriterion("asid >=", value, "asid");
            return (Criteria) this;
        }

        public Criteria andAsidLessThan(Integer value) {
            addCriterion("asid <", value, "asid");
            return (Criteria) this;
        }

        public Criteria andAsidLessThanOrEqualTo(Integer value) {
            addCriterion("asid <=", value, "asid");
            return (Criteria) this;
        }

        public Criteria andAsidIn(List<Integer> values) {
            addCriterion("asid in", values, "asid");
            return (Criteria) this;
        }

        public Criteria andAsidNotIn(List<Integer> values) {
            addCriterion("asid not in", values, "asid");
            return (Criteria) this;
        }

        public Criteria andAsidBetween(Integer value1, Integer value2) {
            addCriterion("asid between", value1, value2, "asid");
            return (Criteria) this;
        }

        public Criteria andAsidNotBetween(Integer value1, Integer value2) {
            addCriterion("asid not between", value1, value2, "asid");
            return (Criteria) this;
        }

        public Criteria andUseridIsNull() {
            addCriterion("userid is null");
            return (Criteria) this;
        }

        public Criteria andUseridIsNotNull() {
            addCriterion("userid is not null");
            return (Criteria) this;
        }

        public Criteria andUseridEqualTo(Integer value) {
            addCriterion("userid =", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotEqualTo(Integer value) {
            addCriterion("userid <>", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridGreaterThan(Integer value) {
            addCriterion("userid >", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridGreaterThanOrEqualTo(Integer value) {
            addCriterion("userid >=", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridLessThan(Integer value) {
            addCriterion("userid <", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridLessThanOrEqualTo(Integer value) {
            addCriterion("userid <=", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridIn(List<Integer> values) {
            addCriterion("userid in", values, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotIn(List<Integer> values) {
            addCriterion("userid not in", values, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridBetween(Integer value1, Integer value2) {
            addCriterion("userid between", value1, value2, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotBetween(Integer value1, Integer value2) {
            addCriterion("userid not between", value1, value2, "userid");
            return (Criteria) this;
        }

        public Criteria andAddressIsNull() {
            addCriterion("address is null");
            return (Criteria) this;
        }

        public Criteria andAddressIsNotNull() {
            addCriterion("address is not null");
            return (Criteria) this;
        }

        public Criteria andAddressEqualTo(String value) {
            addCriterion("address =", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotEqualTo(String value) {
            addCriterion("address <>", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressGreaterThan(String value) {
            addCriterion("address >", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressGreaterThanOrEqualTo(String value) {
            addCriterion("address >=", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLessThan(String value) {
            addCriterion("address <", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLessThanOrEqualTo(String value) {
            addCriterion("address <=", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLike(String value) {
            addCriterion("address like", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotLike(String value) {
            addCriterion("address not like", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressIn(List<String> values) {
            addCriterion("address in", values, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotIn(List<String> values) {
            addCriterion("address not in", values, "address");
            return (Criteria) this;
        }

        public Criteria andAddressBetween(String value1, String value2) {
            addCriterion("address between", value1, value2, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotBetween(String value1, String value2) {
            addCriterion("address not between", value1, value2, "address");
            return (Criteria) this;
        }

        public Criteria andPostcIsNull() {
            addCriterion("postc is null");
            return (Criteria) this;
        }

        public Criteria andPostcIsNotNull() {
            addCriterion("postc is not null");
            return (Criteria) this;
        }

        public Criteria andPostcEqualTo(String value) {
            addCriterion("postc =", value, "postc");
            return (Criteria) this;
        }

        public Criteria andPostcNotEqualTo(String value) {
            addCriterion("postc <>", value, "postc");
            return (Criteria) this;
        }

        public Criteria andPostcGreaterThan(String value) {
            addCriterion("postc >", value, "postc");
            return (Criteria) this;
        }

        public Criteria andPostcGreaterThanOrEqualTo(String value) {
            addCriterion("postc >=", value, "postc");
            return (Criteria) this;
        }

        public Criteria andPostcLessThan(String value) {
            addCriterion("postc <", value, "postc");
            return (Criteria) this;
        }

        public Criteria andPostcLessThanOrEqualTo(String value) {
            addCriterion("postc <=", value, "postc");
            return (Criteria) this;
        }

        public Criteria andPostcLike(String value) {
            addCriterion("postc like", value, "postc");
            return (Criteria) this;
        }

        public Criteria andPostcNotLike(String value) {
            addCriterion("postc not like", value, "postc");
            return (Criteria) this;
        }

        public Criteria andPostcIn(List<String> values) {
            addCriterion("postc in", values, "postc");
            return (Criteria) this;
        }

        public Criteria andPostcNotIn(List<String> values) {
            addCriterion("postc not in", values, "postc");
            return (Criteria) this;
        }

        public Criteria andPostcBetween(String value1, String value2) {
            addCriterion("postc between", value1, value2, "postc");
            return (Criteria) this;
        }

        public Criteria andPostcNotBetween(String value1, String value2) {
            addCriterion("postc not between", value1, value2, "postc");
            return (Criteria) this;
        }

        public Criteria andRecnameIsNull() {
            addCriterion("recname is null");
            return (Criteria) this;
        }

        public Criteria andRecnameIsNotNull() {
            addCriterion("recname is not null");
            return (Criteria) this;
        }

        public Criteria andRecnameEqualTo(String value) {
            addCriterion("recname =", value, "recname");
            return (Criteria) this;
        }

        public Criteria andRecnameNotEqualTo(String value) {
            addCriterion("recname <>", value, "recname");
            return (Criteria) this;
        }

        public Criteria andRecnameGreaterThan(String value) {
            addCriterion("recname >", value, "recname");
            return (Criteria) this;
        }

        public Criteria andRecnameGreaterThanOrEqualTo(String value) {
            addCriterion("recname >=", value, "recname");
            return (Criteria) this;
        }

        public Criteria andRecnameLessThan(String value) {
            addCriterion("recname <", value, "recname");
            return (Criteria) this;
        }

        public Criteria andRecnameLessThanOrEqualTo(String value) {
            addCriterion("recname <=", value, "recname");
            return (Criteria) this;
        }

        public Criteria andRecnameLike(String value) {
            addCriterion("recname like", value, "recname");
            return (Criteria) this;
        }

        public Criteria andRecnameNotLike(String value) {
            addCriterion("recname not like", value, "recname");
            return (Criteria) this;
        }

        public Criteria andRecnameIn(List<String> values) {
            addCriterion("recname in", values, "recname");
            return (Criteria) this;
        }

        public Criteria andRecnameNotIn(List<String> values) {
            addCriterion("recname not in", values, "recname");
            return (Criteria) this;
        }

        public Criteria andRecnameBetween(String value1, String value2) {
            addCriterion("recname between", value1, value2, "recname");
            return (Criteria) this;
        }

        public Criteria andRecnameNotBetween(String value1, String value2) {
            addCriterion("recname not between", value1, value2, "recname");
            return (Criteria) this;
        }

        public Criteria andPhoneIsNull() {
            addCriterion("phone is null");
            return (Criteria) this;
        }

        public Criteria andPhoneIsNotNull() {
            addCriterion("phone is not null");
            return (Criteria) this;
        }

        public Criteria andPhoneEqualTo(String value) {
            addCriterion("phone =", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotEqualTo(String value) {
            addCriterion("phone <>", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneGreaterThan(String value) {
            addCriterion("phone >", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneGreaterThanOrEqualTo(String value) {
            addCriterion("phone >=", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneLessThan(String value) {
            addCriterion("phone <", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneLessThanOrEqualTo(String value) {
            addCriterion("phone <=", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneLike(String value) {
            addCriterion("phone like", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotLike(String value) {
            addCriterion("phone not like", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneIn(List<String> values) {
            addCriterion("phone in", values, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotIn(List<String> values) {
            addCriterion("phone not in", values, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneBetween(String value1, String value2) {
            addCriterion("phone between", value1, value2, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotBetween(String value1, String value2) {
            addCriterion("phone not between", value1, value2, "phone");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}