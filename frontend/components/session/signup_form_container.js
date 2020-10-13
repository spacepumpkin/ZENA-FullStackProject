import { connect } from "react-redux";
import SessionForm from "./session_form";

const mapStateToProps = function (state) {
  return {
    formType: "Sign Up",
    user: { email: "", password: "" },
  };
};

const mapDispatchToProps = function (dispatch) {
  return {

  };
};

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);