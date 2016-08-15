# New ports collection makefile for:	dump.rb
# Date created:		20 July 2001
# Whom:			Akinori MUSHA aka knu <knu@idaemons.org>
#
# $MidnightBSD$
# $FreeBSD: ports/converters/ruby-dump.rb/Makefile,v 1.4 2005/11/11 01:17:20 linimon Exp $
#

PORTNAME=	dump.rb
PORTVERSION=	0.2
CATEGORIES=	converters ruby
MASTER_SITES=	http://www.geocities.co.jp/SiliconValley-Oakland/2986/ruby/
PKGNAMEPREFIX=	${RUBY_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:R}.txt
EXTRACT_SUFX=	# none
DIST_SUBDIR=	ruby

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Binary data dumper module for Ruby

LICENSE=	unknown

USE_RUBY=	yes
RUBY_NO_BUILD_DEPENDS=	yes

NO_WRKSUBDIR=	yes
NO_BUILD=	yes
PLIST_FILES=	%%RUBY_SITELIBDIR%%/dump.rb
EXTRACT_CMD=	${CP}
EXTRACT_BEFORE_ARGS=	# none
EXTRACT_AFTER_ARGS=	.

do-install:
	${MKDIR} ${RUBY_SITELIBDIR}
	${INSTALL_DATA} ${WRKSRC}/${DISTNAME} ${RUBY_SITELIBDIR}/${PORTNAME}

.include <bsd.port.mk>
