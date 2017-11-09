require 'spec_helper'
require './spec/sisimai/bite/email/code'
enginename = 'Sendmail'
isexpected = [
  { 'n' => '01', 's' => /\A5[.]1[.]1\z/,    'r' => /userunknown/,     'b' => /\A0\z/ },
  { 'n' => '02', 's' => /\A5[.][12][.]1\z/, 'r' => /(?:userunknown|filtered)/, 'b' => /\d\z/ },
  { 'n' => '03', 's' => /\A5[.]1[.]1\z/,    'r' => /userunknown/,     'b' => /\A0\z/ },
  { 'n' => '04', 's' => /\A5[.]1[.]8\z/,    'r' => /rejected/,        'b' => /\A1\z/ },
  { 'n' => '05', 's' => /\A5[.]2[.]3\z/,    'r' => /exceedlimit/,     'b' => /\A1\z/ },
  { 'n' => '06', 's' => /\A5[.]6[.]9\z/,    'r' => /contenterror/,    'b' => /\A1\z/ },
  { 'n' => '07', 's' => /\A5[.]7[.]1\z/,    'r' => /norelaying/,      'b' => /\A1\z/ },
  { 'n' => '08', 's' => /\A4[.]7[.]1\z/,    'r' => /blocked/,         'b' => /\A1\z/ },
  { 'n' => '09', 's' => /\A5[.]7[.]9\z/,    'r' => /policyviolation/, 'b' => /\A1\z/ },
  { 'n' => '10', 's' => /\A4[.]7[.]1\z/,    'r' => /blocked/,         'b' => /\A1\z/ },
  { 'n' => '11', 's' => /\A4[.]4[.]7\z/,    'r' => /expired/,         'b' => /\A1\z/ },
  { 'n' => '12', 's' => /\A4[.]4[.]7\z/,    'r' => /expired/,         'b' => /\A1\z/ },
  { 'n' => '13', 's' => /\A5[.]3[.]0\z/,    'r' => /systemerror/,     'b' => /\A1\z/ },
  { 'n' => '14', 's' => /\A5[.]1[.]1\z/,    'r' => /userunknown/,     'b' => /\A0\z/ },
  { 'n' => '15', 's' => /\A5[.]1[.]2\z/,    'r' => /hostunknown/,     'b' => /\A0\z/ },
  { 'n' => '16', 's' => /\A5[.]5[.]0\z/,    'r' => /blocked/,         'b' => /\A1\z/ },
  { 'n' => '17', 's' => /\A5[.]1[.]6\z/,    'r' => /hasmoved/,        'b' => /\A0\z/ },
  { 'n' => '18', 's' => /\A5[.]0[.]0\z/,    'r' => /mailererror/,     'b' => /\A1\z/ },
  { 'n' => '19', 's' => /\A5[.]2[.]0\z/,    'r' => /filtered/,        'b' => /\A1\z/ },
  { 'n' => '20', 's' => /\A5[.]4[.]6\z/,    'r' => /networkerror/,    'b' => /\A1\z/ },
  { 'n' => '21', 's' => /\A4[.]4[.]7\z/,    'r' => /blocked/,         'b' => /\A1\z/ },
  { 'n' => '22', 's' => /\A5[.]1[.]6\z/,    'r' => /hasmoved/,        'b' => /\A0\z/ },
  { 'n' => '23', 's' => /\A5[.]7[.]1\z/,    'r' => /spamdetected/,    'b' => /\A1\z/ },
  { 'n' => '24', 's' => /\A5[.]1[.]2\z/,    'r' => /hostunknown/,     'b' => /\A0\z/ },
  { 'n' => '25', 's' => /\A5[.]1[.]1\z/,    'r' => /userunknown/,     'b' => /\A0\z/ },
  { 'n' => '26', 's' => /\A5[.]1[.]1\z/,    'r' => /userunknown/,     'b' => /\A0\z/ },
  { 'n' => '27', 's' => /\A5[.]0[.]0\z/,    'r' => /filtered/,        'b' => /\A1\z/ },
  { 'n' => '28', 's' => /\A5[.]1[.]1\z/,    'r' => /userunknown/,     'b' => /\A0\z/ },
  { 'n' => '29', 's' => /\A4[.]5[.]0\z/,    'r' => /expired/,         'b' => /\A1\z/ },
  { 'n' => '30', 's' => /\A4[.]4[.]7\z/,    'r' => /expired/,         'b' => /\A1\z/ },
  { 'n' => '31', 's' => /\A5[.]7[.]0\z/,    'r' => /securityerror/,   'b' => /\A1\z/ },
  { 'n' => '32', 's' => /\A5[.]1[.]1\z/,    'r' => /userunknown/,     'b' => /\A0\z/ },
  { 'n' => '33', 's' => /\A5[.]7[.]1\z/,    'r' => /blocked/,         'b' => /\A1\z/ },
  { 'n' => '34', 's' => /\A5[.]7[.]0\z/,    'r' => /securityerror/,   'b' => /\A1\z/ },
  { 'n' => '35', 's' => /\A5[.]7[.]13\z/,   'r' => /suspend/,         'b' => /\A1\z/ },
  { 'n' => '36', 's' => /\A5[.]7[.]1\z/,    'r' => /blocked/,         'b' => /\A1\z/ },
  { 'n' => '37', 's' => /\A5[.]1[.]1\z/,    'r' => /userunknown/,     'b' => /\A0\z/ },
  { 'n' => '38', 's' => /\A5[.]7[.]1\z/,    'r' => /spamdetected/,    'b' => /\A1\z/ },
  { 'n' => '39', 's' => /\A4[.]4[.]5\z/,    'r' => /systemfull/,      'b' => /\A1\z/ },
  { 'n' => '40', 's' => /\A5[.]2[.]0\z/,    'r' => /filtered/,        'b' => /\A1\z/ },
  { 'n' => '41', 's' => /\A5[.]0[.]0\z/,    'r' => /filtered/,        'b' => /\A1\z/ },
  { 'n' => '42', 's' => /\A5[.]1[.]2\z/,    'r' => /hostunknown/,     'b' => /\A0\z/ },
  { 'n' => '43', 's' => /\A5[.]7[.]1\z/,    'r' => /policyviolation/, 'b' => /\A1\z/ },
  { 'n' => '44', 's' => /\A5[.]6[.]0\z/,    'r' => /contenterror/,    'b' => /\A1\z/ },
  { 'n' => '45', 's' => /\A5[.]1[.]1\z/,    'r' => /userunknown/,     'b' => /\A0\z/ },
  { 'n' => '46', 's' => /\A5[.]5[.]0\z/,    'r' => /userunknown/,     'b' => /\A0\z/ },
  { 'n' => '47', 's' => /\A5[.]1[.]1\z/,    'r' => /userunknown/,     'b' => /\A0\z/ },
  { 'n' => '48', 's' => /\A5[.]7[.]1\z/,    'r' => /filtered/,        'b' => /\A1\z/ },
]
Sisimai::Bite::Email::Code.maketest(enginename, isexpected)

