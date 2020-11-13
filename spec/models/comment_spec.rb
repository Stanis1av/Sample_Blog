require 'spec_helper'
require 'rails_helper'

describe Comment do
  it { should belong_to :article }
end
