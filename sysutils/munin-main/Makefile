# $MidnightBSD: mports/sysutils/munin-main/Makefile,v 1.2 2008/06/26 21:24:40 laffer1 Exp $

PORTNAME=	munin
PORTVERSION=	1.2.6
CATEGORIES=	sysutils perl5
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}%20stable/${PORTVERSION}
MASTER_SITE_SUBDIR=	munin
PKGNAMESUFFIX=	-main
DISTNAME=	${PORTNAME}_${PORTVERSION:S/.r/rc/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collector part of Munin
LICENSE=	gpl2

USE_PERL5=	yes

RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/RRDs.pm:${PORTSDIR}/databases/rrdtool \
		${SITE_PERL}/Net/Domain.pm:${PORTSDIR}/net/p5-Net \
		${SITE_PERL}/HTML/Template.pm:${PORTSDIR}/www/p5-HTML-Template \
		${SITE_PERL}/Date/Manip.pm:${PORTSDIR}/devel/p5-Date-Manip
BUILD_DEPENDS=	${RUN_DEPENDS}

.include <bsd.port.pre.mk>

USE_GMAKE=	yes
PATCH_STRIP=	-p1
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION:S/.r/rc/}
PKGMESSAGE=	${WRKDIR}/pkg-message
ALL_TARGET=	WWWDIR=${WWWDIR} DATADIR=${DATADIR} PERL=${PERL} build build-man
INSTALL_TARGET=	WWWDIR=${WWWDIR} DATADIR=${FAKE_DESTDIR}/${DATADIR} PERL=${PERL} SITE_PERL_REL=$(SITE_PERL_REL) install-main

MAN5=		munin.conf.5
MAN8=		munin-cron.8 munin-graph.8 munin-html.8 munin-limits.8 munin-update.8

SUB_FILES=pkg-message

pre-install:
	@${SETENV} PKG_PREFIX=${PREFIX} ${SH} ${PKGINSTALL} ${PKGNAME} PRE-INSTALL

post-install:
	${MKDIR} ${WWWDIR}
	@${INSTALL_DATA} ${WRKSRC}/build/server/munin.conf ${PREFIX}/etc/munin/munin.conf.sample
	@for man in ${MAN5}; do \
		${INSTALL_MAN} -C ${WRKSRC}/build/doc/$$man ${PREFIX}/man/man5; \
	done
	@for man in ${MAN8}; do \
		${INSTALL_MAN} -C ${WRKSRC}/build/doc/$$man ${PREFIX}/man/man8; \
	done
	@DATADIR=${DATADIR} PKG_PREFIX=${PREFIX} ${SH} pkg-install ${PKGNAME} POST-INSTALL
	@${CHOWN} munin /var/log/munin-main
	@${CHGRP} munin /var/run/munin /var/log/munin-main ${WWWDIR} ${PREFIX}/var/munin

.include <bsd.port.post.mk>
