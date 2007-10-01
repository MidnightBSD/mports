# ports collection makefile for:	Berkeley DB
# Date created:				26 Jan 1998
# Whom:					Josh Tiefenbach <josh@ican.net>
#
# $FreeBSD: ports/databases/db2/Makefile,v 1.39 2006/08/14 22:55:03 clsung Exp $
# $MidnightBSD: mports/databases/db2/Makefile,v 1.3 2007/08/09 19:38:16 laffer1 Exp $
#

PORTNAME=	db2
PORTVERSION=	2.7.7
PORTREVISION=	2
CATEGORIES=	databases
#MASTER_SITES=	http://www.sleepycat.com/update/snapshot/
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	../../src/misc
DISTNAME=	db-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Berkeley DB package, revision 2

LICENSE=	bdb

WRKSRC=		${WRKDIR}/${DISTNAME}/build_unix

USE_LDCONFIG=	yes
GNU_CONFIGURE=		yes
CONFIGURE_SCRIPT=	../dist/configure
CONFIGURE_ARGS=		--enable-compat185 \
			--enable-dump185 --enable-cxx

.if !defined(NOPORTDOCS)
PORTDOCS=	*
INSTALL_TARGET=	install install_docs
.endif

post-install:
	@-${RM} -fr ${PREFIX}/share/examples/db2
	${MKDIR} ${PREFIX}/share/examples/db2
	cd ${WRKSRC}/..; \
	    ${TAR} -cf - --exclude tags examples/ examples_cxx/ examples_java/. \
		| ( cd ${PREFIX}/share/examples/db2; ${TAR} xf - )
	@${ECHO_MSG} ""
	@${ECHO_MSG} "Java support for ${PKGNAME} is *not* built by default, and requires that you"
	@${ECHO_MSG} "have a working copy of the JDK (v1.1) installed."
	@${ECHO_MSG} ""
	@${ECHO_MSG} "To build java support, please read:"
	@${ECHO_MSG} ""
	@${ECHO_MSG} "${WRKDIR}/${DISTNAME}/java/README"
	@${ECHO_MSG} ""
	@${ECHO_MSG} "and follow the directions therein."

.include <bsd.port.mk>
