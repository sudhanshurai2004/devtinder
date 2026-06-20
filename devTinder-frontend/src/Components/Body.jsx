import { Outlet, useNavigate } from "react-router-dom";
import Navbar from "./Navbar";
import Footer from "./Footer";
import axios from "axios";
import { BASE_URL } from "../utils/constants";
import { useDispatch, useSelector } from "react-redux";
import { addUser, removeUser } from "../utils/userSlice";
import { useEffect } from "react";

const Body = () => {
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const user = useSelector((store) => store.user);

  const fetchUser = async () => {
    try {
      const user = await axios.get(BASE_URL + "/profile/view", {
        withCredentials: true,
      });
      // console.log(user.data);
      dispatch(addUser(user.data));
    } catch (err) {
      if (err.response?.status === 401) {
        dispatch(removeUser());
        navigate("/login");
      }
      console.log(err);
    }
  };

  useEffect(() => {
    if (!user) {
      fetchUser();
    }
  }, []);
  return (
    <div className="min-h-screen flex flex-col">
      <Navbar />
      <main className="pt-20 flex-1">
        <Outlet />
      </main>
      <Footer />
    </div>
  );
};

export default Body;
