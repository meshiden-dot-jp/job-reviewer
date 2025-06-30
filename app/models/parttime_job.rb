class ParttimeJob < ApplicationRecord
    CATEGORIES = [
        "飲食",
        "接客",
        "販売",
        "事務",
        "清掃",
        "製造",
        "運輸",
        "教育",
        "医療",
        "IT",
        "その他"
    ]

    validates :name, presence: true, length: { maximum: 100 }
    validates :category, presence: true, inclusion: { in: CATEGORIES }
end
