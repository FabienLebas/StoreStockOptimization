require 'test_helper'

class SeasonalitiesControllerTest < ActionController::TestCase
  setup do
    @seasonality = seasonalities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seasonalities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seasonality" do
    assert_difference('Seasonality.count') do
      post :create, :seasonality => { :seasonality => @seasonality.seasonality, :w1 => @seasonality.w1, :w10 => @seasonality.w10, :w11 => @seasonality.w11, :w12 => @seasonality.w12, :w13 => @seasonality.w13, :w14 => @seasonality.w14, :w15 => @seasonality.w15, :w16 => @seasonality.w16, :w17 => @seasonality.w17, :w18 => @seasonality.w18, :w19 => @seasonality.w19, :w2 => @seasonality.w2, :w20 => @seasonality.w20, :w21 => @seasonality.w21, :w22 => @seasonality.w22, :w23 => @seasonality.w23, :w24 => @seasonality.w24, :w25 => @seasonality.w25, :w26 => @seasonality.w26, :w27 => @seasonality.w27, :w28 => @seasonality.w28, :w29 => @seasonality.w29, :w3 => @seasonality.w3, :w30 => @seasonality.w30, :w31 => @seasonality.w31, :w32 => @seasonality.w32, :w33 => @seasonality.w33, :w34 => @seasonality.w34, :w35 => @seasonality.w35, :w36 => @seasonality.w36, :w37 => @seasonality.w37, :w38 => @seasonality.w38, :w39 => @seasonality.w39, :w4 => @seasonality.w4, :w40 => @seasonality.w40, :w41 => @seasonality.w41, :w42 => @seasonality.w42, :w43 => @seasonality.w43, :w44 => @seasonality.w44, :w45 => @seasonality.w45, :w46 => @seasonality.w46, :w47 => @seasonality.w47, :w48 => @seasonality.w48, :w49 => @seasonality.w49, :w5 => @seasonality.w5, :w50 => @seasonality.w50, :w51 => @seasonality.w51, :w52 => @seasonality.w52, :w53 => @seasonality.w53, :w6 => @seasonality.w6, :w7 => @seasonality.w7, :w8 => @seasonality.w8, :w9 => @seasonality.w9 }
    end

    assert_redirected_to seasonality_path(assigns(:seasonality))
  end

  test "should show seasonality" do
    get :show, :id => @seasonality
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @seasonality
    assert_response :success
  end

  test "should update seasonality" do
    put :update, :id => @seasonality, :seasonality => { :seasonality => @seasonality.seasonality, :w1 => @seasonality.w1, :w10 => @seasonality.w10, :w11 => @seasonality.w11, :w12 => @seasonality.w12, :w13 => @seasonality.w13, :w14 => @seasonality.w14, :w15 => @seasonality.w15, :w16 => @seasonality.w16, :w17 => @seasonality.w17, :w18 => @seasonality.w18, :w19 => @seasonality.w19, :w2 => @seasonality.w2, :w20 => @seasonality.w20, :w21 => @seasonality.w21, :w22 => @seasonality.w22, :w23 => @seasonality.w23, :w24 => @seasonality.w24, :w25 => @seasonality.w25, :w26 => @seasonality.w26, :w27 => @seasonality.w27, :w28 => @seasonality.w28, :w29 => @seasonality.w29, :w3 => @seasonality.w3, :w30 => @seasonality.w30, :w31 => @seasonality.w31, :w32 => @seasonality.w32, :w33 => @seasonality.w33, :w34 => @seasonality.w34, :w35 => @seasonality.w35, :w36 => @seasonality.w36, :w37 => @seasonality.w37, :w38 => @seasonality.w38, :w39 => @seasonality.w39, :w4 => @seasonality.w4, :w40 => @seasonality.w40, :w41 => @seasonality.w41, :w42 => @seasonality.w42, :w43 => @seasonality.w43, :w44 => @seasonality.w44, :w45 => @seasonality.w45, :w46 => @seasonality.w46, :w47 => @seasonality.w47, :w48 => @seasonality.w48, :w49 => @seasonality.w49, :w5 => @seasonality.w5, :w50 => @seasonality.w50, :w51 => @seasonality.w51, :w52 => @seasonality.w52, :w53 => @seasonality.w53, :w6 => @seasonality.w6, :w7 => @seasonality.w7, :w8 => @seasonality.w8, :w9 => @seasonality.w9 }
    assert_redirected_to seasonality_path(assigns(:seasonality))
  end

  test "should destroy seasonality" do
    assert_difference('Seasonality.count', -1) do
      delete :destroy, :id => @seasonality
    end

    assert_redirected_to seasonalities_path
  end
end
