# $MidnightBSD$

PORTNAME=	tpm-emulator
PORTVERSION=	0.7.4
CATEGORIES=	emulators security
MASTER_SITES=	SF/${PORTNAME}.berlios
DISTNAME=	${PORTNAME:S,-,_,}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Trusted Platform Module (TPM) emulator

LICENSE=	gpl2

LIB_DEPENDS=	libgmp.so:${PORTSDIR}/math/gmp

CONFLICTS=	trousers-tddl-[0-9]*

USES=		cmake:outsource
USE_RC_SUBR=	tpmd
CMAKE_ENV=	PREFIX="${PREFIX}"
CMAKE_ARGS=	-DTPM_INCLUDE_DIRS:STRING="${LOCALBASE}/include" \
		-DTPM_LIBRARY_DIRS:STRING="${LOCALBASE}/lib"
USE_LDCONFIG=	yes
USERS=		_tss
GROUPS=		_tss
SUB_LIST=	USERS="${USERS}" GROUPS="${GROUPS}"

post-install:
	@${ECHO_CMD} "@exec ${INSTALL} -d -o ${USERS} -g ${GROUPS} -m 0700 /var/run/tpm" >> ${TMPPLIST}
	@${MKDIR} ${STAGEDIR}/var/run/tpm
	@${ECHO_CMD} "@dirrmtry /var/run/tpm" >> ${TMPPLIST}
	@${ECHO_CMD} "@exec ${INSTALL} -d -o ${USERS} -g ${GROUPS} -m 0700 %D/var/db/tpm" >> ${TMPPLIST}
	@${MKDIR} ${STAGEDIR}/${PREFIX}/var/db/tpm

.include <bsd.port.mk>
