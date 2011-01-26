# New ports collection makefile for:	Ruby-BDB1
# Date created:		16 January 2002
# Whom:			Akinori MUSHA aka knu <knu@idaemons.org>
#
# $MidnightBSD: mports/databases/ruby-bdb1/Makefile,v 1.1 2007/03/21 01:02:58 laffer1 Exp $
# $FreeBSD: ports/databases/ruby-bdb1/Makefile,v 1.18 2006/11/19 15:50:36 miwi Exp $
#

PORTNAME=	bdb1
PORTVERSION=	0.2.3
CATEGORIES=	databases ruby
MASTER_SITES=	ftp://moulon.inra.fr/pub/ruby/
PKGNAMEPREFIX=	${RUBY_PKGNAMEPREFIX}
DIST_SUBDIR=	ruby

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby interface to Berkeley DB revision 1.8x with full feature support
LICENSE=	gpl2
# same terms as ruby

USE_RUBY=	yes
USE_RUBY_EXTCONF=	yes
USE_RUBY_RDOC=		yes

NOPORTDOCS=	# XXX

INSTALL_TARGET=	site-install

DOCS=		Changes \
		README.en \
		bdb1.html \
		bdb1.rd \
		docs/*.html \
		docs/*.rd \
		docs/doc

post-build:
.if !defined(NOPORTDOCS)
	cd ${BUILD_WRKSRC}; ${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} rdoc
.endif

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${RUBY_MODEXAMPLESDIR}/
	${CP} -R ${WRKSRC}/examples/* ${RUBY_MODEXAMPLESDIR}/
	${MKDIR} ${RUBY_MODDOCDIR}
.for f in ${DOCS}
	${CP} -R ${WRKSRC}/${f} ${RUBY_MODDOCDIR}/
.endfor
.endif

.include <bsd.port.mk>
