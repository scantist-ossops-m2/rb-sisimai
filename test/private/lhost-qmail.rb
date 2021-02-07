module LhostEngineTest::Private
  module Qmail
    IsExpected = {
      # INDEX => [['D.S.N.', 'replycode', 'REASON', 'hardbounce'], [...]]
      '01001' => [['5.0.910', '',    'filtered',        false]],
      '01002' => [['5.0.900', '',    'undefined',       false]],
      '01003' => [['5.0.912', '550', 'hostunknown',     true]],
      '01004' => [['5.1.1',   '',    'userunknown',     true]],
      '01005' => [['5.0.912', '550', 'hostunknown',     true]],
      '01006' => [['5.1.1',   '',    'userunknown',     true]],
      '01007' => [['5.0.912', '550', 'hostunknown',     true]],
      '01008' => [['5.1.1',   '',    'userunknown',     true]],
      '01009' => [['5.1.1',   '',    'userunknown',     true]],
      '01010' => [['5.0.912', '550', 'hostunknown',     true]],
      '01011' => [['5.0.912', '550', 'hostunknown',     true]],
      '01012' => [['5.0.911', '',    'userunknown',     true]],
      '01013' => [['5.1.1',   '',    'userunknown',     true]],
      '01014' => [['5.0.918', '550', 'rejected',        false]],
      '01015' => [['5.7.1',   '550', 'rejected',        false]],
      '01016' => [['5.1.2',   '',    'hostunknown',     true]],
      '01017' => [['5.1.1',   '550', 'userunknown',     true]],
      '01018' => [['5.1.1',   '511', 'userunknown',     true]],
      '01019' => [['5.0.922', '',    'mailboxfull',     false]],
      '01020' => [['5.0.910', '554', 'filtered',        false]],
      '01021' => [['5.1.1',   '',    'userunknown',     true]],
      '01022' => [['5.1.1',   '550', 'userunknown',     true]],
      '01023' => [['5.0.911', '550', 'userunknown',     true]],
      '01024' => [['5.0.911', '550', 'userunknown',     true]],
      '01025' => [['5.1.1',   '550', 'userunknown',     true],
                  ['5.2.1',   '550', 'userunknown',     true]],
      '01026' => [['5.0.934', '552', 'mesgtoobig',      false]],
      '01027' => [['5.2.2',   '550', 'mailboxfull',     false]],
      '01028' => [['5.1.1',   '550', 'userunknown',     true]],
      '01029' => [['5.0.910', '550', 'filtered',        false]],
      '01030' => [['5.1.1',   '550', 'userunknown',     true]],
      '01031' => [['5.0.911', '550', 'userunknown',     true]],
      '01032' => [['4.4.1',   '',    'networkerror',    false]],
      '01033' => [['5.0.922', '',    'mailboxfull',     false]],
      '01034' => [['4.2.2',   '450', 'mailboxfull',     false]],
      '01035' => [['5.0.922', '552', 'mailboxfull',     false]],
      '01036' => [['5.1.1',   '',    'userunknown',     true]],
      '01037' => [['5.1.2',   '',    'hostunknown',     true]],
      '01038' => [['5.0.910', '550', 'filtered',        false]],
      '01039' => [['5.0.922', '',    'mailboxfull',     false]],
      '01040' => [['5.1.1',   '',    'mailboxfull',     false]],
      '01041' => [['5.5.0',   '550', 'userunknown',     true]],
      '01042' => [['5.1.1',   '550', 'userunknown',     true],
                  ['5.2.1',   '550', 'userunknown',     true]],
      '01043' => [['5.7.1',   '550', 'rejected',        false]],
      '01044' => [['5.0.0',   '501', 'blocked',         false]],
      '01045' => [['4.4.3',   '',    'systemerror',     false]],
      '01046' => [['4.2.2',   '450', 'mailboxfull',     false]],
      '01047' => [['5.5.0',   '550', 'userunknown',     true]],
      '01048' => [['5.2.2',   '',    'mailboxfull',     false]],
      '01049' => [['5.2.2',   '',    'mailboxfull',     false]],
      '01050' => [['5.1.1',   '',    'userunknown',     true]],
      '01051' => [['5.0.900', '',    'undefined',       false]],
      '01052' => [['5.0.921', '554', 'suspend',         false]],
      '01053' => [['5.0.910', '554', 'filtered',        false]],
      '01054' => [['5.0.911', '550', 'userunknown',     true]],
      '01055' => [['5.0.922', '',    'mailboxfull',     false]],
      '01056' => [['5.1.1',   '',    'userunknown',     true]],
      '01057' => [['5.0.911', '550', 'userunknown',     true]],
      '01058' => [['5.1.1',   '550', 'userunknown',     true]],
      '01059' => [['5.0.910', '',    'filtered',        false]],
      '01060' => [['5.0.921', '',    'suspend',         false]],
      '01061' => [['5.0.910', '554', 'filtered',        false]],
      '01062' => [['5.0.910', '554', 'filtered',        false]],
      '01063' => [['5.1.1',   '',    'userunknown',     true]],
      '01064' => [['5.1.1',   '',    'userunknown',     true]],
      '01065' => [['5.0.922', '',    'mailboxfull',     false]],
      '01066' => [['5.1.1',   '',    'userunknown',     true]],
      '01067' => [['5.1.0',   '550', 'userunknown',     true]],
      '01068' => [['5.0.911', '550', 'userunknown',     true]],
      '01069' => [['5.0.910', '',    'filtered',        false]],
      '01070' => [['5.0.912', '',    'hostunknown',     true],
                  ['5.0.912', '',    'hostunknown',     true]],
      '01071' => [['5.7.1',   '554', 'norelaying',      false]],
      '01072' => [['5.0.912', '',    'hostunknown',     true]],
      '01073' => [['5.0.921', '',    'suspend',         false]],
    }
  end
end

