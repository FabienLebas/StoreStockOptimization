class Seasonality < ActiveRecord::Base
  attr_accessible :seasonality, :w1, :w10, :w11, :w12, :w13, :w14, :w15, :w16, :w17, :w18, :w19, :w2, :w20, :w21, :w22, :w23, :w24, :w25, :w26, :w27, :w28, :w29, :w3, :w30, :w31, :w32, :w33, :w34, :w35, :w36, :w37, :w38, :w39, :w4, :w40, :w41, :w42, :w43, :w44, :w45, :w46, :w47, :w48, :w49, :w5, :w50, :w51, :w52, :w53, :w6, :w7, :w8, :w9, :user
  has_many:articles
end
