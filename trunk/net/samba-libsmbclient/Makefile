# $MidnightBSD$
# $FreeBSD: head/net/samba-libsmbclient/Makefile 364390 2014-08-08 21:36:33Z timur $

PORTREVISION=		2
PORTEPOCH=		0
PKGNAMESUFFIX=		-libsmbclient

COMMENT=		Shared lib from the samba package

CONFLICTS=

SAMBA_PORT=		samba43
SAMBA_SUBPORT=		yes

MASTERDIR=		${.CURDIR}/../${SAMBA_PORT}
PKGDIR=			${.CURDIR}

USE_LDCONFIG=		${PREFIX}/lib

# We WANT shared libs
CONFIGURE_ARGS+=	--with-libsmbclient

ALL_TARGET=		libsmbclient

do-install:
			-@${MKDIR} ${MAN7PREFIX}/man/man7
			${INSTALL_MAN} ${WRKDIR}/${DISTNAME}/docs/manpages/libsmbclient.7 ${MAN7PREFIX}/man/man7
			-@${MKDIR} ${PREFIX}/include
			${INSTALL_DATA} ${WRKSRC}/include/libsmbclient.h ${PREFIX}/include
			${INSTALL_DATA} ${WRKSRC}/pkgconfig/smbclient.pc ${PREFIX}/libdata/pkgconfig/
			-@${MKDIR} ${PREFIX}/lib
			${INSTALL_SCRIPT} ${WRKSRC}/bin/libsmbclient.a ${PREFIX}/lib
			${INSTALL_SCRIPT} ${WRKSRC}/bin/libsmbclient.so ${PREFIX}/lib/libsmbclient.so.0
			${LN} -snf libsmbclient.so.0 ${PREFIX}/lib/libsmbclient.so
			-@${MKDIR} ${EXAMPLESDIR}
			@${CP} -Rp ${WRKDIR}/${DISTNAME}/examples/libsmbclient/ ${EXAMPLESDIR}

.include "${MASTERDIR}/Makefile"
