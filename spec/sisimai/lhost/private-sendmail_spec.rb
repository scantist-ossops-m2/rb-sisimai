require 'spec_helper'
require './spec/sisimai/lhost/code'
enginename = 'Sendmail'
isexpected = [
  { 'n' => '01001', 'r' => /suspend/ },
  { 'n' => '01002', 'r' => /blocked/ },
  { 'n' => '01003', 'r' => /expired/ },
  { 'n' => '01004', 'r' => /(?:userunknown|delivered)/ },
  { 'n' => '01005', 'r' => /expired/ },
  { 'n' => '01006', 'r' => /expired/ },
  { 'n' => '01007', 'r' => /expired/ },
  { 'n' => '01008', 'r' => /filtered/ },
  { 'n' => '01009', 'r' => /expired/ },
  { 'n' => '01010', 'r' => /blocked/ },
  { 'n' => '01011', 'r' => /blocked/ },
  { 'n' => '01012', 'r' => /systemerror/ },
  { 'n' => '01013', 'r' => /userunknown/ },
  { 'n' => '01014', 'r' => /expired/ },
  { 'n' => '01015', 'r' => /hostunknown/ },
  { 'n' => '01016', 'r' => /expired/ },
  { 'n' => '01017', 'r' => /expired/ },
  { 'n' => '01018', 'r' => /hostunknown/ },
  { 'n' => '01019', 'r' => /blocked/ },
  { 'n' => '01020', 'r' => /expired/ },
  { 'n' => '01021', 'r' => /expired/ },
  { 'n' => '01022', 'r' => /expired/ },
  { 'n' => '01023', 'r' => /expired/ },
  { 'n' => '01024', 'r' => /filtered/ },
  { 'n' => '01025', 'r' => /mesgtoobig/ },
  { 'n' => '01026', 'r' => /blocked/ },
  { 'n' => '01027', 'r' => /rejected/ },
  { 'n' => '01028', 'r' => /norelaying/ },
  { 'n' => '01029', 'r' => /spamdetected/ },
  { 'n' => '01030', 'r' => /suspend/ },
  { 'n' => '01031', 'r' => /suspend/ },
  { 'n' => '01032', 'r' => /mailererror/ },
  { 'n' => '01033', 'r' => /mailererror/ },
  { 'n' => '01034', 'r' => /mailererror/ },
  { 'n' => '01035', 'r' => /userunknown/ },
  { 'n' => '01036', 'r' => /filtered/ },
  { 'n' => '01037', 'r' => /filtered/ },
  { 'n' => '01038', 'r' => /userunknown/ },
  { 'n' => '01039', 'r' => /(?:filtered|userunknown)/ },
  { 'n' => '01040', 'r' => /userunknown/ },
  { 'n' => '01041', 'r' => /filtered/ },
  { 'n' => '01042', 'r' => /userunknown/ },
  { 'n' => '01043', 'r' => /userunknown/ },
  { 'n' => '01044', 'r' => /userunknown/ },
  { 'n' => '01045', 'r' => /userunknown/ },
  { 'n' => '01046', 'r' => /userunknown/ },
  { 'n' => '01047', 'r' => /blocked/ },
  { 'n' => '01048', 'r' => /userunknown/ },
  { 'n' => '01049', 'r' => /userunknown/ },
  { 'n' => '01050', 'r' => /userunknown/ },
  { 'n' => '01051', 'r' => /userunknown/ },
  { 'n' => '01052', 'r' => /userunknown/ },
  { 'n' => '01053', 'r' => /userunknown/ },
  { 'n' => '01054', 'r' => /userunknown/ },
  { 'n' => '01055', 'r' => /userunknown/ },
  { 'n' => '01056', 'r' => /userunknown/ },
  { 'n' => '01057', 'r' => /userunknown/ },
  { 'n' => '01058', 'r' => /norelaying/ },
  { 'n' => '01059', 'r' => /userunknown/ },
  { 'n' => '01060', 'r' => /userunknown/ },
  { 'n' => '01061', 'r' => /blocked/ },
  { 'n' => '01062', 'r' => /userunknown/ },
  { 'n' => '01063', 'r' => /userunknown/ },
  { 'n' => '01064', 'r' => /userunknown/ },
  { 'n' => '01065', 'r' => /userunknown/ },
  { 'n' => '01066', 'r' => /userunknown/ },
  { 'n' => '01067', 'r' => /userunknown/ },
  { 'n' => '01068', 'r' => /userunknown/ },
  { 'n' => '01069', 'r' => /userunknown/ },
  { 'n' => '01070', 'r' => /userunknown/ },
  { 'n' => '01071', 'r' => /userunknown/ },
  { 'n' => '01072', 'r' => /userunknown/ },
  { 'n' => '01073', 'r' => /userunknown/ },
  { 'n' => '01074', 'r' => /userunknown/ },
  { 'n' => '01075', 'r' => /userunknown/ },
  { 'n' => '01076', 'r' => /userunknown/ },
  { 'n' => '01077', 'r' => /userunknown/ },
  { 'n' => '01078', 'r' => /userunknown/ },
  { 'n' => '01079', 'r' => /userunknown/ },
  { 'n' => '01080', 'r' => /userunknown/ },
  { 'n' => '01081', 'r' => /userunknown/ },
  { 'n' => '01082', 'r' => /userunknown/ },
  { 'n' => '01083', 'r' => /userunknown/ },
  { 'n' => '01084', 'r' => /filtered/ },
  { 'n' => '01085', 'r' => /filtered/ },
  { 'n' => '01086', 'r' => /hostunknown/ },
  { 'n' => '01087', 'r' => /hostunknown/ },
  { 'n' => '01088', 'r' => /hostunknown/ },
  { 'n' => '01089', 'r' => /norelaying/ },
  { 'n' => '01090', 'r' => /filtered/ },
  { 'n' => '01091', 'r' => /filtered/ },
  { 'n' => '01092', 'r' => /filtered/ },
  { 'n' => '01093', 'r' => /suspend/ },
  { 'n' => '01094', 'r' => /mailboxfull/ },
  { 'n' => '01095', 'r' => /mailboxfull/ },
  { 'n' => '01096', 'r' => /mailboxfull/ },
  { 'n' => '01097', 'r' => /mailboxfull/ },
  { 'n' => '01098', 'r' => /exceedlimit/ },
  { 'n' => '01099', 'r' => /exceedlimit/ },
  { 'n' => '01100', 'r' => /exceedlimit/ },
  { 'n' => '01101', 'r' => /systemerror/ },
  { 'n' => '01102', 'r' => /filtered/ },
  { 'n' => '01103', 'r' => /filtered/ },
  { 'n' => '01104', 'r' => /mesgtoobig/ },
  { 'n' => '01105', 'r' => /mesgtoobig/ },
  { 'n' => '01106', 'r' => /mesgtoobig/ },
  { 'n' => '01107', 'r' => /systemerror/ },
  { 'n' => '01108', 'r' => /systemerror/ },
  { 'n' => '01109', 'r' => /filtered/ },
  { 'n' => '01110', 'r' => /filtered/ },
  { 'n' => '01111', 'r' => /networkerror/ },
  { 'n' => '01112', 'r' => /mailererror/ },
  { 'n' => '01113', 'r' => /contenterror/ },
  { 'n' => '01114', 'r' => /policyviolation/ },
  { 'n' => '01115', 'r' => /policyviolation/ },
  { 'n' => '01116', 'r' => /spamdetected/ },
  { 'n' => '01117', 'r' => /spamdetected/ },
  { 'n' => '01118', 'r' => /userunknown/ },
  { 'n' => '01119', 'r' => /filtered/ },
  { 'n' => '01120', 'r' => /filtered/ },
  { 'n' => '01121', 'r' => /filtered/ },
  { 'n' => '01122', 'r' => /userunknown/ },
  { 'n' => '01124', 'r' => /expired/ },
  { 'n' => '01125', 'r' => /mesgtoobig/ },
  { 'n' => '01127', 'r' => /userunknown/ },
  { 'n' => '01128', 'r' => /(?:rejected|filtered|userunknown|hostunknown|blocked)/ },
  { 'n' => '01129', 'r' => /hasmoved/ },
  { 'n' => '01130', 'r' => /userunknown/ },
  { 'n' => '01131', 'r' => /filtered/ },
  { 'n' => '01132', 'r' => /filtered/ },
  { 'n' => '01133', 'r' => /filtered/ },
  { 'n' => '01134', 'r' => /mesgtoobig/ },
  { 'n' => '01135', 'r' => /userunknown/ },
  { 'n' => '01136', 'r' => /hostunknown/ },
  { 'n' => '01137', 'r' => /(?:userunknown|mailboxfull)/ },
  { 'n' => '01138', 'r' => /filtered/ },
  { 'n' => '01139', 'r' => /filtered/ },
  { 'n' => '01140', 'r' => /filtered/ },
  { 'n' => '01141', 'r' => /userunknown/ },
  { 'n' => '01142', 'r' => /policyviolation/ },
  { 'n' => '01143', 'r' => /userunknown/ },
  { 'n' => '01144', 'r' => /userunknown/ },
  { 'n' => '01145', 'r' => /userunknown/ },
  { 'n' => '01146', 'r' => /userunknown/ },
  { 'n' => '01147', 'r' => /mesgtoobig/ },
  { 'n' => '01148', 'r' => /userunknown/ },
  { 'n' => '01149', 'r' => /userunknown/ },
  { 'n' => '01150', 'r' => /userunknown/ },
  { 'n' => '01151', 'r' => /mailboxfull/ },
  { 'n' => '01152', 'r' => /systemerror/ },
  { 'n' => '01153', 'r' => /mailererror/ },
  { 'n' => '01154', 'r' => /userunknown/ },
  { 'n' => '01155', 'r' => /mesgtoobig/ },
  { 'n' => '01156', 'r' => /userunknown/ },
  { 'n' => '01157', 'r' => /(?:hostunknown|filtered)/ },
  { 'n' => '01158', 'r' => /expired/ },
  { 'n' => '01159', 'r' => /mailboxfull/ },
  { 'n' => '01160', 'r' => /filtered/ },
  { 'n' => '01161', 'r' => /userunknown/ },
  { 'n' => '01162', 'r' => /(?:userunknown|filtered)/ },
  { 'n' => '01163', 'r' => /userunknown/ },
  { 'n' => '01164', 'r' => /rejected/ },
  { 'n' => '01165', 'r' => /exceedlimit/ },
  { 'n' => '01166', 'r' => /contenterror/ },
  { 'n' => '01167', 'r' => /norelaying/ },
  { 'n' => '01168', 'r' => /blocked/ },
  { 'n' => '01169', 'r' => /policyviolation/ },
  { 'n' => '01170', 'r' => /blocked/ },
  { 'n' => '01171', 'r' => /expired/ },
  { 'n' => '01172', 'r' => /systemerror/ },
  { 'n' => '01173', 'r' => /userunknown/ },
  { 'n' => '01174', 'r' => /hostunknown/ },
  { 'n' => '01175', 'r' => /blocked/ },
  { 'n' => '01176', 'r' => /hasmoved/ },
  { 'n' => '01177', 'r' => /mailererror/ },
  { 'n' => '01178', 'r' => /hostunknown/ },
  { 'n' => '01179', 'r' => /userunknown/ },
  { 'n' => '01181', 'r' => /mesgtoobig/ },
  { 'n' => '01182', 'r' => /userunknown/ },
  { 'n' => '01183', 'r' => /suspend/ },
  { 'n' => '01184', 'r' => /filtered/ },
  { 'n' => '01185', 'r' => /expired/ },
  { 'n' => '01186', 'r' => /policyviolation/ },
  { 'n' => '01187', 'r' => /blocked/ },
  { 'n' => '01188', 'r' => /userunknown/ },
  { 'n' => '01189', 'r' => /expired/ },
  { 'n' => '01190', 'r' => /spamdetected/ },
  { 'n' => '01191', 'r' => /suspend/ },
  { 'n' => '01192', 'r' => /userunknown/ },
  { 'n' => '01193', 'r' => /userunknown/ },
  { 'n' => '01194', 'r' => /suspend/ },
  { 'n' => '01195', 'r' => /policyviolation/ },
  { 'n' => '01196', 'r' => /suspend/ },
  { 'n' => '01197', 'r' => /userunknown/ },
  { 'n' => '01198', 'r' => /userunknown/ },
  { 'n' => '01199', 'r' => /blocked/ },
  { 'n' => '01200', 'r' => /hostunknown/ },
  { 'n' => '01201', 'r' => /spamdetected/ },
  { 'n' => '01202', 'r' => /systemfull/ },
  { 'n' => '01203', 'r' => /spamdetected/ },
  { 'n' => '01204', 'r' => /suspend/ },
  { 'n' => '01205', 'r' => /userunknown/ },
  { 'n' => '01206', 'r' => /systemerror/ },
  { 'n' => '01207', 'r' => /userunknown/ },
  { 'n' => '01208', 'r' => /expired/ },
  { 'n' => '01209', 'r' => /spamdetected/ },
  { 'n' => '01210', 'r' => /userunknown/ },
  { 'n' => '01211', 'r' => /userunknown/ },
  { 'n' => '01212', 'r' => /filtered/ },
  { 'n' => '01213', 'r' => /filtered/ },
  { 'n' => '01214', 'r' => /userunknown/ },
  { 'n' => '01215', 'r' => /userunknown/ },
  { 'n' => '01216', 'r' => /userunknown/ },
  { 'n' => '01217', 'r' => /blocked/ },
  { 'n' => '01218', 'r' => /blocked/ },
  { 'n' => '01219', 'r' => /userunknown/ },
]
Sisimai::Lhost::Code.maketest(enginename, isexpected, true)
