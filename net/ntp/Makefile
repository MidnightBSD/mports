# $MidnightBSD: mports/net/ntp/Makefile,v 1.13 2011/05/28 18:14:28 laffer1 Exp $
# $FreeBSD: ports/net/ntp/Makefile,v 1.50 2008/01/13 04:17:07 cy Exp $

PORTNAME=	ntp
PORTVERSION?=	4.2.6p5
PORTREVISION=	0
CATEGORIES=	net ipv6
MASTER_SITES=	ftp://ftp.udel.edu/pub/ntp/ntp4/ \
		http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ \
		ftp://ftp.archive.de.uu.net/pub/unix/ntp/ntp4/ \
		ftp://ftp.netlab.is.tsukuba.ac.jp/pub/network/ntp/ntp4/
DISTNAME=	${PORTNAME}-${PORTVERSION:S/P/p/:S/.r/-RC/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Network Time Protocol Distribution
LICENSE=	other

LATEST_LINK=	${PORTNAME}

USE_GCPIO=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.1
USE_AUTOTOOLS=	automake libtool

USE_RC_SUBR=    ntp

MAN1=           sntp.1 \
                ntpd.1 \
                ntpdc.1 \
                ntpq.1 \
                ntp-keygen.1 \

OPTIONS=	NTPSNMPD "Build and install ntpsnmpd" OFF \
		RAWDCF "Enable RAWDCF option" OFF \
		SSL "Enable SSL" ON

.include <bsd.port.pre.mk>

.if defined(WITH_RAWDCF)
CONFIGURE_ARGS+=	--enable-RAWDCF
.endif

.if !defined(WITH_SSL)
CONFIGURE_ARGS+=	--without-crypto
PLIST_SUB+=		SSL="@comment "
.else
USE_OPENSSL=		yes
CONFIGURE_ARGS+=	--with-openssl-incdir=${OPENSSLINC} \
			--with-openssl-libdir=${OPENSSLLIB}
PLIST_SUB+=		SSL=""
.endif
CONFIGURE_ARGS+=	--enable-ipv6

.if defined(WITH_NTPSNMPD)
PLIST_FILES+=		bin/ntpsnmpd
BUILD_DEPENDS+=		${LOCALBASE}/include/net-snmp/net-snmp-config.h:${PORTSDIR}/net-mgmt/net-snmp
RUN_DEPENDS+=		${LOCALBASE}/include/net-snmp/net-snmp-config.h:${PORTSDIR}/net-mgmt/net-snmp
.else
CONFIGURE_ARGS+=	--without-ntpsnmpd
.endif

pre-configure:
	@cd ${WRKSRC} && ./bootstrap

post-install:
	@${MKDIR} ${EXAMPLESDIR}
	@${INSTALL_DATA} ${WRKSRC}/conf/* ${EXAMPLESDIR}
	@${INSTALL_DATA} ${FILESDIR}/ntp.conf ${EXAMPLESDIR}/ntp.conf.sample
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${FIND} ${WRKSRC}/html -type f | ${XARGS} ${CHMOD} ${SHAREMODE}
	@cd ${WRKSRC}/html && ${FIND} . -print | \
		${CPIO} -pdu -R ${SHAREOWN}:${SHAREGRP} --quiet ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
