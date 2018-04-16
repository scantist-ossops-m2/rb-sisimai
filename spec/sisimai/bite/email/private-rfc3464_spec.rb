require 'spec_helper'
require './spec/sisimai/bite/email/code'
enginename = 'RFC3464'
isexpected = [
  { 'n' => '01001', 'r' => /expired/ },
  { 'n' => '01002', 'r' => /userunknown/ },
  { 'n' => '01003', 'r' => /mesgtoobig/ },
  { 'n' => '01004', 'r' => /filtered/ },
  { 'n' => '01005', 'r' => /networkerror/ },
  { 'n' => '01007', 'r' => /onhold/ },
  { 'n' => '01008', 'r' => /expired/ },
  { 'n' => '01009', 'r' => /userunknown/ },
  { 'n' => '01011', 'r' => /hostunknown/ },
  { 'n' => '01013', 'r' => /filtered/ },
  { 'n' => '01014', 'r' => /userunknown/ },
  { 'n' => '01015', 'r' => /hostunknown/ },
  { 'n' => '01016', 'r' => /userunknown/ },
  { 'n' => '01017', 'r' => /userunknown/ },
  { 'n' => '01018', 'r' => /mailboxfull/ },
  { 'n' => '01019', 'r' => /filtered/ },
  { 'n' => '01020', 'r' => /userunknown/ },
  { 'n' => '01021', 'r' => /filtered/ },
  { 'n' => '01022', 'r' => /userunknown/ },
  { 'n' => '01023', 'r' => /filtered/ },
  { 'n' => '01024', 'r' => /userunknown/ },
  { 'n' => '01025', 'r' => /filtered/ },
  { 'n' => '01026', 'r' => /filtered/ },
  { 'n' => '01027', 'r' => /filtered/ },
  { 'n' => '01029', 'r' => /filtered/ },
  { 'n' => '01031', 'r' => /userunknown/ },
  { 'n' => '01033', 'r' => /userunknown/ },
  { 'n' => '01035', 'r' => /userunknown/ },
  { 'n' => '01036', 'r' => /filtered/ },
  { 'n' => '01037', 'r' => /systemerror/ },
  { 'n' => '01038', 'r' => /filtered/ },
  { 'n' => '01039', 'r' => /hostunknown/ },
  { 'n' => '01040', 'r' => /networkerror/ },
  { 'n' => '01041', 'r' => /filtered/ },
  { 'n' => '01042', 'r' => /filtered/ },
  { 'n' => '01043', 'r' => /(?:filtered|onhold)/ },
  { 'n' => '01044', 'r' => /userunknown/ },
  { 'n' => '01045', 'r' => /userunknown/ },
  { 'n' => '01046', 'r' => /userunknown/ },
  { 'n' => '01047', 'r' => /undefined/ },
  { 'n' => '01048', 'r' => /filtered/ },
  { 'n' => '01049', 'r' => /userunknown/ },
  { 'n' => '01050', 'r' => /filtered/ },
  { 'n' => '01051', 'r' => /userunknown/ },
  { 'n' => '01052', 'r' => /undefined/ },
  { 'n' => '01053', 'r' => /mailererror/ },
  { 'n' => '01054', 'r' => /undefined/ },
  { 'n' => '01055', 'r' => /filtered/ },
  { 'n' => '01056', 'r' => /mailboxfull/ },
  { 'n' => '01057', 'r' => /filtered/ },
  { 'n' => '01058', 'r' => /undefined/ },
  { 'n' => '01059', 'r' => /userunknown/ },
  { 'n' => '01060', 'r' => /filtered/ },
  { 'n' => '01061', 'r' => /hasmoved/ },
  { 'n' => '01062', 'r' => /userunknown/ },
  { 'n' => '01063', 'r' => /filtered/ },
  { 'n' => '01064', 'r' => /filtered/ },
  { 'n' => '01065', 'r' => /spamdetected/ },
  { 'n' => '01066', 'r' => /filtered/ },
  { 'n' => '01067', 'r' => /systemerror/ },
  { 'n' => '01068', 'r' => /undefined/ },
  { 'n' => '01069', 'r' => /expired/ },
  { 'n' => '01070', 'r' => /userunknown/ },
  { 'n' => '01071', 'r' => /mailboxfull/ },
  { 'n' => '01072', 'r' => /filtered/ },
  { 'n' => '01073', 'r' => /filtered/ },
  { 'n' => '01074', 'r' => /filtered/ },
  { 'n' => '01075', 'r' => /filtered/ },
  { 'n' => '01076', 'r' => /systemerror/ },
  { 'n' => '01077', 'r' => /filtered/ },
  { 'n' => '01078', 'r' => /userunknown/ },
  { 'n' => '01079', 'r' => /filtered/ },
  { 'n' => '01081', 'r' => /(?:filtered|syntaxerror)/ },
  { 'n' => '01083', 'r' => /filtered/ },
  { 'n' => '01085', 'r' => /filtered/ },
  { 'n' => '01086', 'r' => /(?:filtered|delivered)/ },
  { 'n' => '01087', 'r' => /filtered/ },
  { 'n' => '01088', 'r' => /onhold/ },
  { 'n' => '01089', 'r' => /filtered/ },
  { 'n' => '01090', 'r' => /filtered/ },
  { 'n' => '01091', 'r' => /undefined/ },
  { 'n' => '01092', 'r' => /undefined/ },
  { 'n' => '01093', 'r' => /filtered/ },
  { 'n' => '01095', 'r' => /filtered/ },
  { 'n' => '01096', 'r' => /filtered/ },
  { 'n' => '01097', 'r' => /filtered/ },
  { 'n' => '01098', 'r' => /filtered/ },
  { 'n' => '01099', 'r' => /securityerror/ },
  { 'n' => '01100', 'r' => /securityerror/ },
  { 'n' => '01101', 'r' => /filtered/ },
  { 'n' => '01102', 'r' => /filtered/ },
  { 'n' => '01103', 'r' => /expired/ },
  { 'n' => '01104', 'r' => /filtered/ },
  { 'n' => '01105', 'r' => /filtered/ },
  { 'n' => '01106', 'r' => /expired/ },
  { 'n' => '01107', 'r' => /filtered/ },
  { 'n' => '01108', 'r' => /undefined/ },
  { 'n' => '01109', 'r' => /onhold/ },
  { 'n' => '01111', 'r' => /mailboxfull/ },
  { 'n' => '01112', 'r' => /filtered/ },
  { 'n' => '01113', 'r' => /filtered/ },
  { 'n' => '01114', 'r' => /systemerror/ },
  { 'n' => '01115', 'r' => /expired/ },
  { 'n' => '01116', 'r' => /mailboxfull/ },
  { 'n' => '01117', 'r' => /mesgtoobig/ },
  { 'n' => '01118', 'r' => /expired/ },
  { 'n' => '01120', 'r' => /filtered/ },
  { 'n' => '01121', 'r' => /expired/ },
  { 'n' => '01122', 'r' => /filtered/ },
  { 'n' => '01123', 'r' => /expired/ },
  { 'n' => '01124', 'r' => /mailererror/ },
  { 'n' => '01125', 'r' => /networkerror/ },
  { 'n' => '01126', 'r' => /userunknown/ },
  { 'n' => '01127', 'r' => /filtered/ },
  { 'n' => '01128', 'r' => /(?:systemerror|onhold)/ },
  { 'n' => '01129', 'r' => /userunknown/ },
  { 'n' => '01130', 'r' => /systemerror/ },
  { 'n' => '01131', 'r' => /userunknown/ },
  { 'n' => '01132', 'r' => /systemerror/ },
  { 'n' => '01133', 'r' => /systemerror/ },
  { 'n' => '01134', 'r' => /filtered/ },
  { 'n' => '01135', 'r' => /userunknown/ },
  { 'n' => '01136', 'r' => /undefined/ },
  { 'n' => '01137', 'r' => /spamdetected/ },
  { 'n' => '01138', 'r' => /userunknown/ },
  { 'n' => '01139', 'r' => /expired/ },
  { 'n' => '01140', 'r' => /filtered/ },
  { 'n' => '01142', 'r' => /filtered/ },
  { 'n' => '01143', 'r' => /undefined/ },
  { 'n' => '01144', 'r' => /filtered/ },
  { 'n' => '01145', 'r' => /mailboxfull/ },
  { 'n' => '01146', 'r' => /mailboxfull/ },
  { 'n' => '01148', 'r' => /mailboxfull/ },
  { 'n' => '01149', 'r' => /expired/ },
  { 'n' => '01150', 'r' => /mailboxfull/ },
  { 'n' => '01151', 'r' => /exceedlimit/ },
  { 'n' => '01153', 'r' => /onhold/ },
  { 'n' => '01154', 'r' => /userunknown/ },
  { 'n' => '01155', 'r' => /networkerror/ },
  { 'n' => '01156', 'r' => /spamdetected/ },
  { 'n' => '01157', 'r' => /filtered/ },
  { 'n' => '01158', 'r' => /(?:expired|onhold)/ },
  { 'n' => '01159', 'r' => /mailboxfull/ },
  { 'n' => '01160', 'r' => /filtered/ },
  { 'n' => '01161', 'r' => /mailererror/ },
  { 'n' => '01162', 'r' => /filtered/ },
  { 'n' => '01163', 'r' => /mesgtoobig/ },
  { 'n' => '01164', 'r' => /userunknown/ },
  { 'n' => '01165', 'r' => /networkerror/ },
  { 'n' => '01166', 'r' => /systemerror/ },
  { 'n' => '01167', 'r' => /hostunknown/ },
  { 'n' => '01168', 'r' => /mailboxfull/ },
  { 'n' => '01169', 'r' => /userunknown/ },
  { 'n' => '01170', 'r' => /onhold/ },
  { 'n' => '01171', 'r' => /onhold/ },
  { 'n' => '01172', 'r' => /mailboxfull/ },
  { 'n' => '01173', 'r' => /networkerror/ },
  { 'n' => '01174', 'r' => /expired/ },
  { 'n' => '01175', 'r' => /filtered/ },
  { 'n' => '01176', 'r' => /filtered/ },
  { 'n' => '01177', 'r' => /(?:filtered|onhold)/ },
  { 'n' => '01178', 'r' => /filtered/ },
  { 'n' => '01179', 'r' => /userunknown/ },
  { 'n' => '01180', 'r' => /mailboxfull/ },
  { 'n' => '01181', 'r' => /filtered/ },
  { 'n' => '01182', 'r' => /onhold/ },
  { 'n' => '01183', 'r' => /mailboxfull/ },
  { 'n' => '01184', 'r' => /(?:undefined|onhold)/ },
  { 'n' => '01185', 'r' => /networkerror/ },
  { 'n' => '01186', 'r' => /networkerror/ },
  { 'n' => '01187', 'r' => /userunknown/ },
  { 'n' => '01188', 'r' => /userunknown/ },
  { 'n' => '01189', 'r' => /userunknown/ },
  { 'n' => '01190', 'r' => /userunknown/ },
  { 'n' => '01191', 'r' => /userunknown/ },
  { 'n' => '01192', 'r' => /userunknown/ },
  { 'n' => '01193', 'r' => /userunknown/ },
  { 'n' => '01194', 'r' => /userunknown/ },
  { 'n' => '01195', 'r' => /norelaying/ },
  { 'n' => '01196', 'r' => /userunknown/ },
  { 'n' => '01197', 'r' => /userunknown/ },
  { 'n' => '01198', 'r' => /userunknown/ },
  { 'n' => '01199', 'r' => /userunknown/ },
  { 'n' => '01200', 'r' => /userunknown/ },
  { 'n' => '01201', 'r' => /userunknown/ },
  { 'n' => '01202', 'r' => /userunknown/ },
  { 'n' => '01203', 'r' => /userunknown/ },
  { 'n' => '01204', 'r' => /userunknown/ },
  { 'n' => '01205', 'r' => /userunknown/ },
  { 'n' => '01206', 'r' => /userunknown/ },
  { 'n' => '01207', 'r' => /securityerror/ },
  { 'n' => '01208', 'r' => /userunknown/ },
  { 'n' => '01209', 'r' => /userunknown/ },
  { 'n' => '01210', 'r' => /userunknown/ },
  { 'n' => '01211', 'r' => /userunknown/ },
  { 'n' => '01212', 'r' => /mailboxfull/ },
  { 'n' => '01213', 'r' => /spamdetected/ },
  { 'n' => '01214', 'r' => /spamdetected/ },
  { 'n' => '01215', 'r' => /spamdetected/ },
  { 'n' => '01216', 'r' => /onhold/ },
  { 'n' => '01217', 'r' => /userunknown/ },
  { 'n' => '01218', 'r' => /toomanyconn/ },
  { 'n' => '01219', 'r' => /onhold/ },
  { 'n' => '01220', 'r' => /filtered/ },
  { 'n' => '01221', 'r' => /filtered/ },
  { 'n' => '01222', 'r' => /mailboxfull/ },
  { 'n' => '01223', 'r' => /mailboxfull/ },
  { 'n' => '01224', 'r' => /filtered/ },
  { 'n' => '01225', 'r' => /expired/ },
  { 'n' => '01226', 'r' => /filtered/ },
  { 'n' => '01227', 'r' => /userunknown/ },
  { 'n' => '01228', 'r' => /onhold/ },
  { 'n' => '01229', 'r' => /filtered/ },
  { 'n' => '01230', 'r' => /filtered/ },
  { 'n' => '01231', 'r' => /filtered/ },
  { 'n' => '01232', 'r' => /networkerror/ },
  { 'n' => '01233', 'r' => /mailererror/ },
  { 'n' => '01234', 'r' => /(?:filtered|onhold)/ },
  { 'n' => '01235', 'r' => /filtered/ },
  { 'n' => '01236', 'r' => /userunknown/ },
  { 'n' => '01237', 'r' => /userunknown/ },
  { 'n' => '01238', 'r' => /userunknown/ },
  { 'n' => '01239', 'r' => /userunknown/ },
  { 'n' => '01240', 'r' => /userunknown/ },
  { 'n' => '01241', 'r' => /userunknown/ },
  { 'n' => '01242', 'r' => /userunknown/ },
  { 'n' => '01243', 'r' => /syntaxerror/ },
  { 'n' => '01244', 'r' => /mailboxfull/ },
  { 'n' => '01245', 'r' => /mailboxfull/ },
  { 'n' => '01246', 'r' => /userunknown/ },
  { 'n' => '01247', 'r' => /userunknown/ },
  { 'n' => '01248', 'r' => /mailboxfull/ },
  { 'n' => '01249', 'r' => /syntaxerror/ },
  { 'n' => '01250', 'r' => /mailboxfull/ },
  { 'n' => '01251', 'r' => /mailboxfull/ },
  { 'n' => '01252', 'r' => /networkerror/ },
  { 'n' => '01253', 'r' => /hostunknown/ },
  { 'n' => '01254', 'r' => /userunknown/ },
  { 'n' => '01255', 'r' => /expired/ },
  { 'n' => '01256', 'r' => /onhold/ },
  { 'n' => '01257', 'r' => /onhold/ },
  { 'n' => '01258', 'r' => /userunknown/ },
  { 'n' => '01259', 'r' => /spamdetected/ },
  { 'n' => '01260', 'r' => /toomanyconn/ },
  { 'n' => '01261', 'r' => /policyviolation/ },
  { 'n' => '01262', 'r' => /expired/ },
  { 'n' => '01263', 'r' => /networkerror/ },
  { 'n' => '01264', 'r' => /networkerror/ },
  { 'n' => '01265', 'r' => /policyviolation/ },
  { 'n' => '01266', 'r' => /policyviolation/ },
  { 'n' => '01267', 'r' => /hasmoved/ },
  { 'n' => '01268', 'r' => /spamdetected/ },
  { 'n' => '01269', 'r' => /networkerror/ },
  { 'n' => '01270', 'r' => /networkerror/ },
  { 'n' => '01271', 'r' => /userunknown/ },
  { 'n' => '01272', 'r' => /spamdetected/ },
  { 'n' => '01273', 'r' => /mailboxfull/ },
  { 'n' => '01274', 'r' => /mailboxfull/ },
  { 'n' => '01275', 'r' => /virusdetected/ },
  { 'n' => '01276', 'r' => /filtered/ },
  { 'n' => '01277', 'r' => /(?:expired|filtered|undefined)/ },
  { 'n' => '01278', 'r' => /(?:expired|undefined)/ },
  { 'n' => '01279', 'r' => /networkerror/ },
]
Sisimai::Bite::Email::Code.maketest(enginename, isexpected, true)

