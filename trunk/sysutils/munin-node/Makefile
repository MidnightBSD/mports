# New ports collection makefile for:	munin-node
# Date created:				25 Januar 2004
# Whom:					Lupe Christoph <lupe@lupe-christoph.de>
#
# $MidnightBSD: mports/sysutils/munin-node/Makefile,v 1.4 2008/06/26 21:25:36 laffer1 Exp $
#

PORTNAME=	munin
PORTVERSION=	1.2.5
CATEGORIES=	sysutils perl5
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	munin
PKGNAMESUFFIX=	-node
DISTNAME=	${PORTNAME}_${PORTVERSION:S/.r/rc/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Node-specific part of Munin
LICENSE=	agg
#gpl2 and others

USE_PERL5=	yes

RUN_DEPENDS=	${SITE_PERL}/Net/Server/Fork.pm:${PORTSDIR}/net/p5-Net-Server
BUILD_DEPENDS=	${RUN_DEPENDS}

.include <bsd.port.pre.mk>

USE_GMAKE=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION:S/.r/rc/}
PKGMESSAGE=	${WRKDIR}/pkg-message
ALL_TARGET=	DATADIR=${DATADIR} PERL=${PERL} build build-man
INSTALL_TARGET=	DATADIR=${FAKE_DESTDIR}/${DATADIR} PERL=${PERL} SITE_PERL_REL=$(SITE_PERL_REL) install-node install-node-plugins
MAKE_ENV=	LANG=C

MAN5=		munin-node.conf.5
MAN8=		munin-node-configure.8 munin-node.8 munin-run.8

SUB_FILES=	pkg-message munin-node.sh
SUB_LIST=	RC_SUBR=${RC_SUBR}
USE_RC_SUBR=	YES

pre-install:
	@${SETENV} PKG_PREFIX=${PREFIX} ${SH} ${PKGINSTALL} ${PKGNAME} PRE-INSTALL

post-install:
	${INSTALL_SCRIPT} ${WRKDIR}/munin-node.sh ${PREFIX}/etc/rc.d/munin-node.sh
	${INSTALL_DATA} ${WRKSRC}/build/node/munin-node.conf ${PREFIX}/etc/munin/munin-node.conf.sample
	${INSTALL_DATA} ${FILESDIR}/plugins.conf ${PREFIX}/etc/munin/plugin-conf.d/plugins.conf.sample
	@if [ ! -f ${PREFIX}/etc/munin/plugin-conf.d/plugins.conf ]; then \
		${INSTALL_DATA} ${PREFIX}/etc/munin/plugin-conf.d/plugins.conf.sample ${PREFIX}/etc/munin/plugin-conf.d/plugins.conf; \
	fi
	@${INSTALL_MAN} -C ${WRKSRC}/build/doc/munin-node.conf.5 ${PREFIX}/man/man5
	@${INSTALL_MAN} -C ${WRKSRC}/build/doc/munin-node-configure.8 ${PREFIX}/man/man8
	@${INSTALL_MAN} -C ${WRKSRC}/build/doc/munin-node.8 ${PREFIX}/man/man8
	@${INSTALL_MAN} -C ${WRKSRC}/build/doc/munin-run.8 ${PREFIX}/man/man8
	@${ECHO} ${DISTNAME} | ${SED} -e 's/munin_//' > ${PREFIX}/etc/munin/VERSION.node

.include <bsd.port.post.mk>
