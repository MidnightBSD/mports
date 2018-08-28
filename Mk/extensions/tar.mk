# $MidnightBSD$
# handle tar archives
#
# Feature:	tar
# Usage:	USES=tar[:[xz|lzma|Z|bzip2|tgz|tbz]]
#

.if !defined(_INCLUDE_USES_TAR_MK)
_INCLUDE_USES_TAR_MK=	yes

tar_ARGS?=	none

.if ${tar_ARGS} == xz
EXTRACT_SUFX?=	.tar.xz
.elif ${tar_ARGS} == lzma
EXTRACT_SUFX?=	.tar.lzma
.elif ${tar_ARGS} == bzip2
EXTRACT_SUFX?=	.tar.bz2
.elif ${tar_ARGS} == tgz
EXTRACT_SUFX?=	.tgz
.elif ${tar_ARGS} == tbz
EXTRACT_SUFX?=	.tbz
.elif ${tar_ARGS} == Z
EXTRACT_SUFX?=	.tar.Z
.elif ${tar_ARGS} == none
EXTRACT_SUFX?=	.tar
.else
IGNORE=	Incorrect 'USES+=tar:${tar_ARGS}'
.endif
.endif
