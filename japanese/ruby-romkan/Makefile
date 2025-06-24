PORTNAME=	romkan
PORTVERSION=	0.4
PORTREVISION=	1
CATEGORIES=	japanese converters ruby
MASTER_SITES=	http://0xcc.net/ruby-romkan/
DISTNAME=	ruby-${PORTNAME}-${PORTVERSION}
DIST_SUBDIR=	ruby

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Romaji <-> Kana conversion library for Ruby
WWW=		http://0xcc.net/ruby-romkan/index.html.en

LICENSE=	ruby

USES=	ruby

NO_BUILD=	yes

EXAMPLES=	test.rb test.sh

DOCS=		ChangeLog romkan.en.rd romkan.ja.rd

OPTIONS_DEFINE=	DOCS EXAMPLES

.include <bsd.port.pre.mk>

PKGNAMEPREFIX:=	${PKGNAMEPREFIX}${RUBY_PKGNAMEPREFIX}

do-install:
	${MKDIR} ${STAGEDIR}/${RUBY_SITELIBDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/romkan.rb ${STAGEDIR}${RUBY_SITELIBDIR}/

do-install-EXAMPLES-on:
	${MKDIR} ${FAKE_DESTDIR}${RUBY_MODEXAMPLESDIR}
.for f in ${EXAMPLES}
	${INSTALL_DATA} ${WRKSRC}/${f} ${FAKE_DESTDIR}${RUBY_MODEXAMPLESDIR}
.endfor

do-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${RUBY_MODDOCDIR}
.for f in ${DOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${FAKE_DESTDIR}${RUBY_MODDOCDIR}/
.endfor

.include <bsd.port.post.mk>
