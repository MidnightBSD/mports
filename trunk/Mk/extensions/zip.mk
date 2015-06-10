# $MidnightBSD$
#
# handle zip archives
#
# Feature:	zip
# Usage:	USES=zip[:infozip]

.if !defined(_INCLUDE_USES_ZIP_Mk)
_INCLUDE_USES_ZIP_MK=	yes

zip_ARGS?=	none

EXTRACT_SUFX?=	.zip

EXTRACT_BEFORE_ARGS?=	-qo
EXTRACT_AFTER_ARGS?=	-d ${WRKDIR}

.if !defined(zip_ARGS) || ${zip_ARGS} == none || ${zip_ARGS}x == x
EXTRACT_CMD?=		${UNZIP_NATIVE_CMD}
.elif ${zip_ARGS} == 'infozip'
EXTRACT_DEPENDS+=	${UNZIP_CMD}:${PORTSDIR}/archivers/unzip
EXTRACT_CMD?=		${UNZIP_CMD}
.else
IGNORE=	Incorrect 'USES+=zip:${zip_ARGS}' expecting 'USES+=zip[:infozip]'
.endif
.endif
