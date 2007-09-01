# ex:ts=8
# Ports collection makefile for:	py-docutils
# Date created:			Sep 14, 2002
# Whom:				ijliao
#
# $MidnightBSD$
# $FreeBSD: ports/textproc/py-docutils/Makefile,v 1.11 2006/02/12 03:21:11 mnag Exp $
#

PORTNAME=	docutils
PORTVERSION=	0.4
CATEGORIES=	textproc python
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python Documentation Utilities

USE_PYTHON=	yes
USE_PYDISTUTILS=	yes

BINS=		bin/rst2xml.py bin/rst2s5.py bin/rst2pseudoxml.py \
		bin/rst2newlatex.py bin/rst2latex.py bin/rst2html.py

post-install:
.for i in ${BINS}
	${MV} -f ${PREFIX}/${i} ${PREFIX}/${i:S/.py//g}
.endfor

.include <bsd.port.mk>
