# New ports collection makefile for:   tcpreplay
# Date created:        2 November 2000
# Whom:                cnh@ivmg.net
#
# $FreeBSD: ports/net-mgmt/tcpreplay/Makefile,v 1.21 2005/12/21 06:02:47 az Exp $
# $MidnightBSD: mports/net-mgmt/tcpreplay/Makefile,v 1.2 2007/06/06 20:58:12 ctriv Exp $
#

PORTNAME=	tcpreplay
PORTVERSION=	2.3.5
CATEGORIES=	net-mgmt
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A tool to replay saved packet capture files
LICENSE=	bsd3

BUILD_DEPENDS=	libnet*>=1.1.2,1:${PORTSDIR}/net/libnet \
		${LOCALBASE}/lib/libpcap.a:${PORTSDIR}/net/libpcap

GNU_CONFIGURE=	yes
# Pickup correct pcap.h; CFLAGS gets overwritten
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include"
CONFIGURE_ARGS=	--with-libpcap=${LOCALBASE} \
		--without-pcapnav-config

FAKE_OPTS=	prefixhack
FAKE_MAKEARGS=	MAN1DIR=${FAKE_DESTDIR}${PREFIX}/man/man1 MAN8DIR=${FAKE_DESTDIR}${PREFIX}/man/man8
MAN1=		capinfo.1 tcpprep.1 pcapmerge.1 flowreplay.1
MAN8=		tcpreplay.8

PLIST_FILES=	bin/capinfo bin/pcapmerge bin/tcpprep sbin/tcpreplay bin/flowreplay

.include <bsd.port.mk>
