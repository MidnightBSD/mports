# Changes some default behaviour of build systems to allow installing as user.
#
# Feature:	fakeroot
# Usage:	USES=fakeroot
# Valid ARGS:	none
#

.if !defined(_INCLUDE_USES_FAKEROOT_MK)
_INCLUDE_USES_FAKEROOT_MK=	yes
BUILD_DEPENDS+=	fakeroot:security/fakeroot
.if ${UID} != 0
FAKEROOT?=	fakeroot
.endif
.endif
