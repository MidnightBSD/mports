# $MidnightBSD: mports/mail/msmtp/Makefile,v 1.5 2009/05/27 20:54:21 crash Exp $

PORTNAME=	msmtp
PORTVERSION=	1.4.17
CATEGORIES=	mail ipv6
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SMTP plugin for MUAs
LICENSE=        gpl3

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS+=	--infodir="${PREFIX}/info" --mandir="${PREFIX}/man"
MAN1=	msmtp.1
INFO=	msmtp

.if defined(WITH_GNUTLS) || defined(WITH_OPENSSL)
RUN_DEPENDS+= ${LOCALBASE}/share/certs/ca-root.crt:${PORTSDIR}/security/ca-roots
.endif

.if defined(WITH_GNUTLS)
LIB_DEPENDS+=	gnutls.13:${PORTSDIR}/security/gnutls
CONFIGURE_ARGS+=	--with-ssl=gnutls
.elif defined(WITH_OPENSSL)
USE_OPENSSL=	yes
CONFIGURE_ARGS+=	--with-ssl=openssl
.else
CONFIGURE_ARGS+=	--without-ssl
.endif

.if defined(WITH_GSASL)
LIB_DEPENDS+=	gsasl.9:${PORTSDIR}/security/gsasl
.else
CONFIGURE_ARGS+=	--without-gsasl
.endif

.if !defined(WITHOUT_IDN)
LIB_DEPENDS+=	idn.16:${PORTSDIR}/dns/libidn
CONFIGURE_ARGS+=	--with-libidn
.else
CONFIGURE_ARGS+=	--without-libidn
.endif

.if !defined(WITHOUT_NLS)
USE_GETTEXT=		yes
CONFIGURE_ARGS+=	--enable-nls
PLIST_SUB=		NLS=""
.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB=		NLS="@comment "
.endif

.include <bsd.port.mk>
