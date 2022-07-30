class Tracking < ApplicationRecord
    SOURCE = { 1 => 'link', 2 => 'tinyurl', 3 => 'qrcode' }.with_indifferent_access
end
