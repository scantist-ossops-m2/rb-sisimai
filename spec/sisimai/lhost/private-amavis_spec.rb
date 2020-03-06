require 'spec_helper'
require './spec/sisimai/lhost/code'
enginename = 'Amavis'
isexpected = [
  { 'n' => '01001', 'r' => /userunknown/ },
  { 'n' => '01002', 'r' => /userunknown/ },
  { 'n' => '01003', 'r' => /spamdetected/ },
]
Sisimai::Lhost::Code.maketest(enginename, isexpected, true)

